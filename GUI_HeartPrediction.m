classdef GUI_HeartPrediction < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                    matlab.ui.Figure
        ENTERButton                 matlab.ui.control.Button
        STRESSLEVELSpinner          matlab.ui.control.Spinner
        STRESSLEVELSpinnerLabel     matlab.ui.control.Label
        FAMILYHISTORYDropDown       matlab.ui.control.DropDown
        FAMILYHISTORYDropDownLabel  matlab.ui.control.Label
        HEARTRATEEditField          matlab.ui.control.NumericEditField
        HEARTRATEEditFieldLabel     matlab.ui.control.Label
        BMIEditField                matlab.ui.control.NumericEditField
        BMIEditFieldLabel           matlab.ui.control.Label
        CHOLESTROLEditField         matlab.ui.control.NumericEditField
        CHOLESTROLEditFieldLabel    matlab.ui.control.Label
        BPEditField                 matlab.ui.control.NumericEditField
        BPEditFieldLabel            matlab.ui.control.Label
        SEXDropDown                 matlab.ui.control.DropDown
        SEXDropDownLabel            matlab.ui.control.Label
        AGEEditField                matlab.ui.control.NumericEditField
        AGEEditFieldLabel           matlab.ui.control.Label
        MATRICNOEditField           matlab.ui.control.NumericEditField
        MATRICNOEditFieldLabel      matlab.ui.control.Label
        NAMEEditField               matlab.ui.control.EditField
        NAMEEditFieldLabel          matlab.ui.control.Label
        IntelligentHeartRiskPredictionLabel  matlab.ui.control.Label
        FIS_model                   % Fuzzy Inference System model
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Color = [0.2863 0.6471 0.8902];
            app.UIFigure.Position = [100 100 727 353];
            app.UIFigure.Name = 'Intelligent Control';

            % Create IntelligentHeartRiskPredictionLabel
            app.IntelligentHeartRiskPredictionLabel = uilabel(app.UIFigure);
            app.IntelligentHeartRiskPredictionLabel.FontSize = 48;
            app.IntelligentHeartRiskPredictionLabel.Position = [30 278 690 63];
            app.IntelligentHeartRiskPredictionLabel.Text = 'Intelligent Heart Risk Prediction';

            % Create NAMEEditFieldLabel
            app.NAMEEditFieldLabel = uilabel(app.UIFigure);
            app.NAMEEditFieldLabel.HorizontalAlignment = 'right';
            app.NAMEEditFieldLabel.FontWeight = 'bold';
            app.NAMEEditFieldLabel.Position = [30 220 40 22];
            app.NAMEEditFieldLabel.Text = 'NAME';

            % Create NAMEEditField
            app.NAMEEditField = uieditfield(app.UIFigure, 'text');
            app.NAMEEditField.Position = [85 220 259 22];

            % Create MATRICNOEditFieldLabel
            app.MATRICNOEditFieldLabel = uilabel(app.UIFigure);
            app.MATRICNOEditFieldLabel.HorizontalAlignment = 'right';
            app.MATRICNOEditFieldLabel.FontWeight = 'bold';
            app.MATRICNOEditFieldLabel.Position = [362 220 72 22];
            app.MATRICNOEditFieldLabel.Text = 'MATRIC NO';

            % Create MATRICNOEditField
            app.MATRICNOEditField = uieditfield(app.UIFigure, 'numeric');
            app.MATRICNOEditField.ValueDisplayFormat = '%.0f';
            app.MATRICNOEditField.Position = [465 220 237 22];

            % Create AGEEditFieldLabel
            app.AGEEditFieldLabel = uilabel(app.UIFigure);
            app.AGEEditFieldLabel.HorizontalAlignment = 'right';
            app.AGEEditFieldLabel.FontWeight = 'bold';
            app.AGEEditFieldLabel.Position = [30 184 31 22];
            app.AGEEditFieldLabel.Text = 'AGE';

            % Create AGEEditField
            app.AGEEditField = uieditfield(app.UIFigure, 'numeric');
            app.AGEEditField.ValueDisplayFormat = '%.0f';
            app.AGEEditField.Position = [85 184 259 22];

            % Create SEXDropDownLabel
            app.SEXDropDownLabel = uilabel(app.UIFigure);
            app.SEXDropDownLabel.HorizontalAlignment = 'right';
            app.SEXDropDownLabel.FontWeight = 'bold';
            app.SEXDropDownLabel.Position = [362 184 29 22];
            app.SEXDropDownLabel.Text = 'SEX';

            % Create SEXDropDown
            app.SEXDropDown = uidropdown(app.UIFigure);
            app.SEXDropDown.Items = {'MALE', 'FEMALE'};
            app.SEXDropDown.Position = [465 184 237 22];
            app.SEXDropDown.Value = 'MALE';

            % Create BPEditFieldLabel
            app.BPEditFieldLabel = uilabel(app.UIFigure);
            app.BPEditFieldLabel.HorizontalAlignment = 'right';
            app.BPEditFieldLabel.FontWeight = 'bold';
            app.BPEditFieldLabel.Position = [30 144 25 22];
            app.BPEditFieldLabel.Text = 'BP';

            % Create BPEditField
            app.BPEditField = uieditfield(app.UIFigure, 'numeric');
            app.BPEditField.Limits = [0 180];
            app.BPEditField.ValueDisplayFormat = '%.0f';
            app.BPEditField.Position = [85 144 259 22];

            % Create CHOLESTROLEditFieldLabel
            app.CHOLESTROLEditFieldLabel = uilabel(app.UIFigure);
            app.CHOLESTROLEditFieldLabel.HorizontalAlignment = 'right';
            app.CHOLESTROLEditFieldLabel.FontWeight = 'bold';
            app.CHOLESTROLEditFieldLabel.Position = [362 144 88 22];
            app.CHOLESTROLEditFieldLabel.Text = 'CHOLESTROL';

            % Create CHOLESTROLEditField
            app.CHOLESTROLEditField = uieditfield(app.UIFigure, 'numeric');
            app.CHOLESTROLEditField.Limits = [0 400];
            app.CHOLESTROLEditField.ValueDisplayFormat = '%.0f';
            app.CHOLESTROLEditField.Position = [465 144 237 22];

            % Create BMIEditFieldLabel
            app.BMIEditFieldLabel = uilabel(app.UIFigure);
            app.BMIEditFieldLabel.HorizontalAlignment = 'right';
            app.BMIEditFieldLabel.FontWeight = 'bold';
            app.BMIEditFieldLabel.Position = [30 103 27 22];
            app.BMIEditFieldLabel.Text = 'BMI';

            % Create BMIEditField
            app.BMIEditField = uieditfield(app.UIFigure, 'numeric');
            app.BMIEditField.Limits = [15 40];
            app.BMIEditField.ValueDisplayFormat = '%.0f';
            app.BMIEditField.Position = [85 103 259 22];
            app.BMIEditField.Value = 15;

            % Create HEARTRATEEditFieldLabel
            app.HEARTRATEEditFieldLabel = uilabel(app.UIFigure);
            app.HEARTRATEEditFieldLabel.HorizontalAlignment = 'right';
            app.HEARTRATEEditFieldLabel.FontWeight = 'bold';
            app.HEARTRATEEditFieldLabel.Position = [362 103 81 22];
            app.HEARTRATEEditFieldLabel.Text = 'HEART RATE';

            % Create HEARTRATEEditField
            app.HEARTRATEEditField = uieditfield(app.UIFigure, 'numeric');
            app.HEARTRATEEditField.Limits = [0 150];
            app.HEARTRATEEditField.ValueDisplayFormat = '%.0f';
            app.HEARTRATEEditField.Position = [465 103 237 22];

            % Create FAMILYHISTORYDropDownLabel
            app.FAMILYHISTORYDropDownLabel = uilabel(app.UIFigure);
            app.FAMILYHISTORYDropDownLabel.HorizontalAlignment = 'right';
            app.FAMILYHISTORYDropDownLabel.FontWeight = 'bold';
            app.FAMILYHISTORYDropDownLabel.Position = [29 64 104 22];
            app.FAMILYHISTORYDropDownLabel.Text = 'FAMILY HISTORY';

            % Create FAMILYHISTORYDropDown
            app.FAMILYHISTORYDropDown = uidropdown(app.UIFigure);
            app.FAMILYHISTORYDropDown.Items = {'YES', 'NO'};
            app.FAMILYHISTORYDropDown.Position = [148 64 196 22];
            app.FAMILYHISTORYDropDown.Value = 'YES';

            % Create STRESSLEVELSpinnerLabel
            app.STRESSLEVELSpinnerLabel = uilabel(app.UIFigure);
            app.STRESSLEVELSpinnerLabel.HorizontalAlignment = 'right';
            app.STRESSLEVELSpinnerLabel.FontWeight = 'bold';
            app.STRESSLEVELSpinnerLabel.Position = [362 64 95 22];
            app.STRESSLEVELSpinnerLabel.Text = 'STRESS LEVEL';

            % Create STRESSLEVELSpinner
            app.STRESSLEVELSpinner = uispinner(app.UIFigure);
            app.STRESSLEVELSpinner.Limits = [1 10];
            app.STRESSLEVELSpinner.ValueDisplayFormat = '%.0f';
            app.STRESSLEVELSpinner.Position = [465 64 237 22];
            app.STRESSLEVELSpinner.Value = 1;

            % Create ENTERButton
            app.ENTERButton = uibutton(app.UIFigure, 'push');
            app.ENTERButton.Position = [315 18 100 23];
            app.ENTERButton.Text = 'ENTER';

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = GUI_HeartPrediction

            % Load FIS model
            app.FIS_model = readfis('anfis_predict.fis');
            %app.FIS_model = readfis('myfis5dim2.fis');

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            % Register the callback for the ENTERButton
            app.ENTERButton.ButtonPushedFcn = @app.enterButtonPushed;

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end

    methods (Access = private)

        % Callback function for ENTERButton
        function enterButtonPushed(app, ~, ~)
            % Gather input data
            name = app.NAMEEditField.Value;
            matric_no = app.MATRICNOEditField.Value;
            age = app.AGEEditField.Value;
            bp = app.BPEditField.Value;
            Cholesterol = app.CHOLESTROLEditField.Value;
            sex = app.SEXDropDown.Value;
            family_history = app.FAMILYHISTORYDropDown.Value;
            stress_level = app.STRESSLEVELSpinner.Value;
            heart_rate = app.HEARTRATEEditField.Value;
            bmi = app.BMIEditField.Value;

            % Verify input values
            if isempty(name) || isempty(matric_no) || isempty(age) || isempty(bp) || isempty(Cholesterol) || isempty(heart_rate) || isempty(bmi)
                msgbox('Please enter all input values.', 'Error', 'error');
                return;
            end

            % Map sex and family history to numeric values
            if strcmpi(sex, 'male')
                sex_value = 0;
            else
                sex_value = 1;
            end

            if strcmpi(family_history, 'yes')
                family_history_value = 0;
            else
                family_history_value = 1;
            end

            % Prepare input vector with mapped values
            input_vector = [Cholesterol, bp, heart_rate, stress_level, bmi];

            % Perform fuzzy inference
            try
                risk = evalfis(input_vector, app.FIS_model);

                % Determine the output label
                if risk <= 0.5
                    risk_label = 'No';
                else
                    risk_label = 'Yes';
                end

                % Display the output
                if strcmpi(risk_label, 'Yes')
                    msgbox(sprintf('Name: %s\nMatric No: %d\nPredicted Heart Attack Risk: %s\nPlease go to the nearest hospital to get the full medical check-up. Your health is important!', name, matric_no, risk_label), 'Heart Attack Risk');
                else
                    msgbox(sprintf('Name: %s\nMatric No: %d\nPredicted Heart Attack Risk: %s', name, matric_no, risk_label), 'Heart Attack Risk');
                end
            catch
                msgbox('Error occurred during fuzzy inference.', 'Error', 'error');
            end
        end
    end
end
