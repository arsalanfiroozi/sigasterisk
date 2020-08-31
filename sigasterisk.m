function [] = sigasterisk(xbar, ybar, xgroup, ygroup, str_show, bars, varargin)
    % Inputs are: 1.Xbar 2.Ybar 3.Xgroup 4.Ygroup, 5.String 6.Bar's Data
    % 7.Distance1(Optional) 8.Distance2(Optional) 9.Threshold3(Optional)
    % 10.Threshold4(Optional)
    %
    % Warning: Do not use categorical bar plot before this function!
    % Instead use this structure:
    %           bar(bars); % Or bar(1:n_groups,bars);
    %           set(gca,'XTickLabel', {'Cat1' 'Cat2' ...});
    %
    %
    % Xbar, Ybar: Which bars are you comparing? (1<=Xbar, Ybar<=number of 
    %             bars in each group)
    % Xgroup, Ygroup: Which groups are you comparing? 
    %                 (1<=Xgroup, Ygroup<=number of groups in the bar) 
    %
    % String: The text you want to show
    %
    % Bar's Data: Data of barplot which it's size should be
    %             (n_Groups,n_Bars)
    %
    % Errors(Optional): matrix of errors which it's size should be 
    %                   (n_Groups,n_Bars)
    %
    % Distance1(Optional): The distance between end of bar column(or error 
    %                      line) and the bottom of vertical lines.
    %
    % Distance2(Optional): The distance between the closest point 
    %                      determined by Distance1 and the horizontal line.
    %
    % Distance3(Optional): The distance between the text and vertical line.
    %
    % Position(Optional): Relative X position of text.
    
    % Values
    nbar = size(bars,2);
    ngroup = size(bars,1);
    
    hold on;
    
    % Pre configuration
    XTicksOld = xticklabels;
    xticksold = xticks;
    height_v = ylim;
    height = height_v(2) - height_v(1);
    xticks(1:ngroup);
    set(gca, 'XTickLabel', 1:ngroup);
    
    % Default vars
    errors = zeros(size(bars));
    threshold(1) = height / 125;
    threshold(2) = height * 2 / 125;
    threshold(3) = height * 1.5 / 125;
    threshold(4) = 0;
    if(length(varargin)>=1)
        if ~isempty(varargin{1})
            errors = varargin{1};
        end
    end
    for i=2:length(varargin)
        if ~isempty(varargin{i})
            threshold(i - 1) = varargin{i};
        end
    end
    
    groupwidth = min(0.8, nbar/(nbar + 1.5));
    %X
    t_x = (1:ngroup) - groupwidth/2 + (2*xbar-1) * groupwidth / (2*nbar);
    x1 = t_x(xgroup);
    t_y = (1:ngroup) - groupwidth/2 + (2*ybar-1) * groupwidth / (2*nbar);
    x2 = t_y(ygroup);
    
    %Y
    y1 = bars(xgroup,xbar);
    y2 = bars(ygroup,ybar);
    if(sign(y1 * y2) == -1)
        error("Error: The bars selected are different in sign. So the process is ignored.");
    end
    
    %P1 & P4
    P1_x = x1;
    P1_y = y1 + (errors(xgroup,xbar) + threshold(1)) * sign(y1);
    P4_x = x2;
    P4_y = y2 + (errors(ygroup,ybar) + threshold(1)) * sign(y2);
    
    %P2 & P3
    P2_x = x1;
    P2_y = P1_y + threshold(2) * sign(P1_y);
    P3_x = x2;
    P3_y = P4_y + threshold(2) * sign(P4_y);
    
    %Correction
    P2_y = max(sign(P2_y)*P2_y,sign(P2_y)*P3_y) * sign(P2_y);
    P3_y = max(sign(P2_y)*P2_y,sign(P2_y)*P3_y) * sign(P2_y);
    
    %Lines
    plot([P1_x P2_x], [P1_y P2_y], 'HandleVisibility','off','Color','black');
    plot([P2_x P3_x], [P2_y P3_y], 'HandleVisibility','off','Color','black');
    plot([P3_x P4_x], [P3_y P4_y], 'HandleVisibility','off','Color','black');
    
    %Text
    text(mean([P2_x, P3_x])+threshold(4), mean([P2_y, P3_y])+threshold(3) * sign(mean([P2_y, P3_y])) - threshold(3) * (sign(mean([P2_y, P3_y])) == -1), str_show, 'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle');
    
    xticks(xticksold);
    set(gca,'XTickLabel', XTicksOld);
    
    hold off;
end

