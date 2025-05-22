import { App, Astal, Gtk, type Gdk } from "astal/gtk3";
import { Variable } from "astal";
import Battery from "gi://AstalBattery";

const time = Variable("").poll(1000, ["date", "+%H:%M"]);
const battery = Battery.get_default();

export default function Bar(gdkmonitor: Gdk.Monitor) {
	const { TOP, LEFT, RIGHT } = Astal.WindowAnchor;

	return (
		<window
			className="Bar"
			gdkmonitor={gdkmonitor}
			exclusivity={Astal.Exclusivity.EXCLUSIVE}
			anchor={TOP | LEFT | RIGHT}
			application={App}
		>
			<centerbox>
				<box halign={Gtk.Align.END}>
					<button className="Battery">
						<label label={`${battery.percentage}%`} />
					</button>
					<button className="Time">
						<label label={time()} />
					</button>
				</box>
			</centerbox>
		</window>
	);
}
