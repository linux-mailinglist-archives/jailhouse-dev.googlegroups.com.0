Return-Path: <jailhouse-dev+bncBCKO35F6UENRBZ56TLZAKGQEQ5KQD5A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x340.google.com (mail-ot1-x340.google.com [IPv6:2607:f8b0:4864:20::340])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F2B15D856
	for <lists+jailhouse-dev@lfdr.de>; Fri, 14 Feb 2020 14:23:53 +0100 (CET)
Received: by mail-ot1-x340.google.com with SMTP id o14sf5074858otp.4
        for <lists+jailhouse-dev@lfdr.de>; Fri, 14 Feb 2020 05:23:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=JAaScG7sfztjYLDiV69g8TZ5b8nzA0MBeUkPFzsGSIg=;
        b=r/B50623H8C+6phEFkRQIcnyKx1a6HB+BjHmpyDAB0t+Khy5w9ZOPyOhoBFL/XjAHA
         dmp3YmFgHJINlLWkybz7NAts8XuGHxPbMJxTiug+ieXumPUy0XJyDW5Xah38JyQuglom
         iP3noxd/zM5TMe4QHbc1LeUyIXZM2ahVti+ZWLdsdQ9wtOOLxypaPIccv2oe1+fbi62A
         uPnjdz/zzHef6zzTsO+th02vXwbk6zmtQ4uOHV9k8zmhT621JlukPyfiiuZY4jtka/vN
         GcAxAC3U+Dw6q2c/LMP5fkNttj2hPt5CZtPPspMIBXIkLEa3Ss3ITn8YG3UzdApfcvPp
         FrFQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=JAaScG7sfztjYLDiV69g8TZ5b8nzA0MBeUkPFzsGSIg=;
        b=e4whiTYq4IDl+OJ6GKuRRLv1qWC4WMOxU6DT05MUwSG3KAA3coGRzryW6LkoWiZ2AK
         gnrESbdUs/4bNb0jjQMSL26eGM/uBbQreQCtYsQ0cQYT3WBEzPnw+aUtw5rfI9FRsgFR
         GE4pHrN3EqdtVnc83OnJy2iUuJOxymhl/dEc3TyKdMEfVGIE5HKnt9fTunv/evDrf4hG
         M1X11QJQ6sw8G3KX50Wz5G1L6XDMFLf+kwkw+LZaNxqjFvfdDym8ZZsEa4GcwQCaa5oj
         ppp7yS2uc43L1BhWLnHNQZUPuO//NZjSO9R60nYIEnTv7uwQIymPoQORGEq+cj9vYdwt
         LY/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=JAaScG7sfztjYLDiV69g8TZ5b8nzA0MBeUkPFzsGSIg=;
        b=ozK6IFxJz7opIAZ9Z+Q2qmh0DQRfcnQWaNpcEHHgGDEHN9k8FcqvNsKHDpNTqKRt/w
         lbh+kVunRYlH1PmgNcQj4wtsPP+jCrjB9ikKxH7jizU070RR4ZCeg0UjM9G9a+mkcZ8F
         SKo7MiSPZPe2XLAqXskvkTM+ay7Zz2WGYY4mudpQiL0OKS1SAgipkMwHLhdmX49Q3Yj1
         vmbAtSQmdqlmqU7Ov10pFcWbO83gxTrfS4o16C7uWRpUqwuqjCzUdCi9/Y3znngK9sY6
         LuYHYDCe1p/6tjRzZfGb5rWPeFVMUAfzTuXnDX162UWbVNcz7JjDj1jyAKPJ7fM/L3hs
         Da+Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAU8DtaVQ/fHiPuf2tROB4vbfZOxTaEg1FfnQ0GbehcFnEVhzrTE
	ABhsp4j9GyKir8JJaCku7+M=
X-Google-Smtp-Source: APXvYqx6lAsy2tzC7s158Fs2r+NbrXVRxfQq2sRXv3g2WoBCOEcVS2CI/+gDKAT+KHuaWIBJQRRqcg==
X-Received: by 2002:aca:1012:: with SMTP id 18mr1731856oiq.151.1581686631753;
        Fri, 14 Feb 2020 05:23:51 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:7109:: with SMTP id n9ls527023otj.10.gmail; Fri, 14 Feb
 2020 05:23:51 -0800 (PST)
X-Received: by 2002:a9d:4d17:: with SMTP id n23mr2267164otf.85.1581686630866;
        Fri, 14 Feb 2020 05:23:50 -0800 (PST)
Date: Fri, 14 Feb 2020 05:23:50 -0800 (PST)
From: raymanfx@gmail.com
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <0a31af1e-1735-40c6-920c-5da6a5d1ad99@googlegroups.com>
Subject: Intel Coffe Lake issues
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_3477_625076872.1581686630001"
X-Original-Sender: raymanfx@gmail.com
Precedence: list
Mailing-list: list jailhouse-dev@googlegroups.com; contact jailhouse-dev+owners@googlegroups.com
List-ID: <jailhouse-dev.googlegroups.com>
X-Spam-Checked-In-Group: jailhouse-dev@googlegroups.com
X-Google-Group-Id: 175645748590
List-Post: <https://groups.google.com/group/jailhouse-dev/post>, <mailto:jailhouse-dev@googlegroups.com>
List-Help: <https://groups.google.com/support/>, <mailto:jailhouse-dev+help@googlegroups.com>
List-Archive: <https://groups.google.com/group/jailhouse-dev
List-Subscribe: <https://groups.google.com/group/jailhouse-dev/subscribe>, <mailto:jailhouse-dev+subscribe@googlegroups.com>
List-Unsubscribe: <mailto:googlegroups-manage+175645748590+unsubscribe@googlegroups.com>,
 <https://groups.google.com/group/jailhouse-dev/subscribe>

------=_Part_3477_625076872.1581686630001
Content-Type: multipart/alternative; 
	boundary="----=_Part_3478_1714725465.1581686630002"

------=_Part_3478_1714725465.1581686630002
Content-Type: text/plain; charset="UTF-8"

Hi all,

I am facing issues related to the integrated GPU (iGPU) on an Intel 
consumer SoC.
First, some generic system information:

Product: Dell OptiPlex 3060 
CPU: Intel(R) Core(TM) i5-8400 CPU @ 2.80GHz

Now, the Jailhouse stack I'm using:
GIT revision: 92db71f257fabd3c08fa4b99498fa61a41ea831d (0.12)
Root cell config: attached

After enabling Jailhouse using: 
jailhouse enable dell-optiplex.cell

I observe logspam in the kernel logs (dmesg) like the following:
[drm:gen8_de_irq_handler [i915]] *ERROR* Fault errors on pipe A: 0x00000080

The same message is repeated numerous times each second.
Unloading Jailhouse stops the logspam.

Reading from the /dev/jailhouse device, I can see there are some VT-d 
issues with the iGPU PCIe device at 00:02.0
<missed 84 bytes of console log>
Using x2APIC
Page pool usage after early setup: mem 59/975, remap 0/131072
Initializing processors:
 CPU 1... (APIC ID 2) OK
 CPU 4... (APIC ID 8) OK
 CPU 2... (APIC ID 4) OK
 CPU 3... (APIC ID 6) OK
 CPU 0... (APIC ID 0) OK
 CPU 5... (APIC ID 10) OK
Initializing unit: VT-d
DMAR unit @0xfed90000/0x1000
DMAR unit @0xfed91000/0x1000
Reserving 120 interrupt(s) for device 00:1e.7 at index 0
Initializing unit: IOAPIC
Initializing unit: Cache Allocation Technology
Initializing unit: PCI
Adding PCI device 00:00.0 to cell "RootCell"
Adding PCI device 00:02.0 to cell "RootCell"
Reserving 1 interrupt(s) for device 00:02.0 at index 120
Adding PCI device 00:08.0 to cell "RootCell"
Reserving 1 interrupt(s) for device 00:08.0 at index 121
Adding PCI device 00:12.0 to cell "RootCell"
Reserving 1 interrupt(s) for device 00:12.0 at index 122
Adding PCI device 00:14.0 to cell "RootCell"
Reserving 8 interrupt(s) for device 00:14.0 at index 123
Adding PCI device 00:14.2 to cell "RootCell"
Adding PCI device 00:16.0 to cell "RootCell"
Reserving 1 interrupt(s) for device 00:16.0 at index 131
Adding PCI device 00:17.0 to cell "RootCell"
Reserving 1 interrupt(s) for device 00:17.0 at index 132
Adding PCI device 00:1c.0 to cell "RootCell"
Reserving 1 interrupt(s) for device 00:1c.0 at index 133
Adding PCI device 00:1c.5 to cell "RootCell"
Reserving 1 interrupt(s) for device 00:1c.5 at index 134
Adding PCI device 00:1f.0 to cell "RootCell"
Adding PCI device 00:1f.3 to cell "RootCell"
Reserving 1 interrupt(s) for device 00:1f.3 at index 135
Adding PCI device 00:1f.4 to cell "RootCell"
Adding PCI device 00:1f.5 to cell "RootCell"
Adding PCI device 01:00.0 to cell "RootCell"
Reserving 4 interrupt(s) for device 01:00.0 at index 136
Adding PCI device 02:00.0 to cell "RootCell"
Reserving 1 interrupt(s) for device 02:00.0 at index 140
Page pool usage after late setup: mem 279/975, remap 16395/131072
Activating hypervisor
VT-d fault event reported by IOMMU 0:
 Source Identifier (bus:dev.func): 00:02.0
 Fault Reason: 0x6 Fault Info: 6a1cea1 Type 1

lspci -nnk
...
00:02.0 VGA compatible controller [0300]: Intel Corporation UHD Graphics 630 
(Desktop) [8086:3e92]
    DeviceName: Onboard - Video
    Subsystem: Dell Device [1028:085c]
    Kernel driver in use: i915
    Kernel modules: i915

Unfortunately I'm not really familiar with VT-d and the Intel 
virtualization stack in general. Does "Fault Reason: 0x6" ring a bell to 
anyone?
I'm happy to provide more information if needed.

Cheers

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/0a31af1e-1735-40c6-920c-5da6a5d1ad99%40googlegroups.com.

------=_Part_3478_1714725465.1581686630002
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi all,</div><div><br></div><div>I am facing issues r=
elated to the integrated GPU (iGPU) on an Intel consumer SoC.</div><div>Fir=
st, some generic system information:</div><div><br></div><div>Product: Dell=
 OptiPlex 3060
<br>CPU: Intel(R) Core(TM) i5-8400 CPU @ 2.80GHz</div><div><br></div><div>N=
ow, the Jailhouse stack I&#39;m using:</div><div>GIT revision: 92db71f257fa=
bd3c08fa4b99498fa61a41ea831d (0.12)</div><div>Root cell config: attached</d=
iv><div><br></div><div>After enabling Jailhouse using: <div style=3D"backgr=
ound-color: rgb(250, 250, 250); border-color: rgb(187, 187, 187); border-st=
yle: solid; border-width: 1px; overflow-wrap: break-word;" class=3D"prettyp=
rint"><code class=3D"prettyprint"><div class=3D"subprettyprint"><span style=
=3D"color: #000;" class=3D"styled-by-prettify">jailhouse enable dell</span>=
<span style=3D"color: #660;" class=3D"styled-by-prettify">-</span><span sty=
le=3D"color: #000;" class=3D"styled-by-prettify">optiplex</span><span style=
=3D"color: #660;" class=3D"styled-by-prettify">.</span><span style=3D"color=
: #000;" class=3D"styled-by-prettify">cell<br></span></div></code></div></d=
iv><div><br></div><div>I observe logspam in the kernel logs (dmesg) like th=
e following:</div><div><div style=3D"background-color: rgb(250, 250, 250); =
border-color: rgb(187, 187, 187); border-style: solid; border-width: 1px; o=
verflow-wrap: break-word;" class=3D"prettyprint"><code class=3D"prettyprint=
"><div class=3D"subprettyprint"><span style=3D"color: #660;" class=3D"style=
d-by-prettify">[</span><span style=3D"color: #000;" class=3D"styled-by-pret=
tify">drm</span><span style=3D"color: #660;" class=3D"styled-by-prettify">:=
</span><span style=3D"color: #000;" class=3D"styled-by-prettify">gen8_de_ir=
q_handler </span><span style=3D"color: #660;" class=3D"styled-by-prettify">=
[</span><span style=3D"color: #000;" class=3D"styled-by-prettify">i915</spa=
n><span style=3D"color: #660;" class=3D"styled-by-prettify">]]</span><span =
style=3D"color: #000;" class=3D"styled-by-prettify"> </span><span style=3D"=
color: #660;" class=3D"styled-by-prettify">*</span><span style=3D"color: #0=
00;" class=3D"styled-by-prettify">ERROR</span><span style=3D"color: #660;" =
class=3D"styled-by-prettify">*</span><span style=3D"color: #000;" class=3D"=
styled-by-prettify"> </span><span style=3D"color: #606;" class=3D"styled-by=
-prettify">Fault</span><span style=3D"color: #000;" class=3D"styled-by-pret=
tify"> errors on pipe A</span><span style=3D"color: #660;" class=3D"styled-=
by-prettify">:</span><span style=3D"color: #000;" class=3D"styled-by-pretti=
fy"> </span><span style=3D"color: #066;" class=3D"styled-by-prettify">0x000=
00080</span></div></code></div></div><div><br></div><div>The same message i=
s repeated numerous times each second.</div><div>Unloading Jailhouse stops =
the logspam.</div><div><br></div><div>Reading from the /dev/jailhouse devic=
e, I can see there are some VT-d issues with the iGPU PCIe device at 00:02.=
0</div><div><div style=3D"background-color: rgb(250, 250, 250); border-colo=
r: rgb(187, 187, 187); border-style: solid; border-width: 1px; overflow-wra=
p: break-word;" class=3D"prettyprint"><code class=3D"prettyprint"><div clas=
s=3D"subprettyprint"><span style=3D"color: #008;" class=3D"styled-by-pretti=
fy">&lt;missed</span><span style=3D"color: #000;" class=3D"styled-by-pretti=
fy"> 84 </span><span style=3D"color: #606;" class=3D"styled-by-prettify">by=
tes</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> </span=
><span style=3D"color: #606;" class=3D"styled-by-prettify">of</span><span s=
tyle=3D"color: #000;" class=3D"styled-by-prettify"> </span><span style=3D"c=
olor: #606;" class=3D"styled-by-prettify">console</span><span style=3D"colo=
r: #000;" class=3D"styled-by-prettify"> </span><span style=3D"color: #606;"=
 class=3D"styled-by-prettify">log</span><span style=3D"color: #008;" class=
=3D"styled-by-prettify">&gt;</span><span style=3D"color: #000;" class=3D"st=
yled-by-prettify"><br>Using x2APIC<br>Page pool usage after early setup: me=
m 59/975, remap 0/131072<br>Initializing processors:<br>=C2=A0CPU 1... (API=
C ID 2) OK<br>=C2=A0CPU 4... (APIC ID 8) OK<br>=C2=A0CPU 2... (APIC ID 4) O=
K<br>=C2=A0CPU 3... (APIC ID 6) OK<br>=C2=A0CPU 0... (APIC ID 0) OK<br>=C2=
=A0CPU 5... (APIC ID 10) OK<br>Initializing unit: VT-d<br>DMAR unit @0xfed9=
0000/0x1000<br>DMAR unit @0xfed91000/0x1000<br>Reserving 120 interrupt(s) f=
or device 00:1e.7 at index 0<br>Initializing unit: IOAPIC<br>Initializing u=
nit: Cache Allocation Technology<br>Initializing unit: PCI<br>Adding PCI de=
vice 00:00.0 to cell &quot;RootCell&quot;<br>Adding PCI device 00:02.0 to c=
ell &quot;RootCell&quot;<br>Reserving 1 interrupt(s) for device 00:02.0 at =
index 120<br>Adding PCI device 00:08.0 to cell &quot;RootCell&quot;<br>Rese=
rving 1 interrupt(s) for device 00:08.0 at index 121<br>Adding PCI device 0=
0:12.0 to cell &quot;RootCell&quot;<br>Reserving 1 interrupt(s) for device =
00:12.0 at index 122<br>Adding PCI device 00:14.0 to cell &quot;RootCell&qu=
ot;<br>Reserving 8 interrupt(s) for device 00:14.0 at index 123<br>Adding P=
CI device 00:14.2 to cell &quot;RootCell&quot;<br>Adding PCI device 00:16.0=
 to cell &quot;RootCell&quot;<br>Reserving 1 interrupt(s) for device 00:16.=
0 at index 131<br>Adding PCI device 00:17.0 to cell &quot;RootCell&quot;<br=
>Reserving 1 interrupt(s) for device 00:17.0 at index 132<br>Adding PCI dev=
ice 00:1c.0 to cell &quot;RootCell&quot;<br>Reserving 1 interrupt(s) for de=
vice 00:1c.0 at index 133<br>Adding PCI device 00:1c.5 to cell &quot;RootCe=
ll&quot;<br>Reserving 1 interrupt(s) for device 00:1c.5 at index 134<br>Add=
ing PCI device 00:1f.0 to cell &quot;RootCell&quot;<br>Adding PCI device 00=
:1f.3 to cell &quot;RootCell&quot;<br>Reserving 1 interrupt(s) for device 0=
0:1f.3 at index 135<br>Adding PCI device 00:1f.4 to cell &quot;RootCell&quo=
t;<br>Adding PCI device 00:1f.5 to cell &quot;RootCell&quot;<br>Adding PCI =
device 01:00.0 to cell &quot;RootCell&quot;<br>Reserving 4 interrupt(s) for=
 device 01:00.0 at index 136<br>Adding PCI device 02:00.0 to cell &quot;Roo=
tCell&quot;<br>Reserving 1 interrupt(s) for device 02:00.0 at index 140<br>=
Page pool usage after late setup: mem 279/975, remap 16395/131072<br>Activa=
ting hypervisor<br>VT-d fault event reported by IOMMU 0:<br>=C2=A0Source Id=
entifier (bus:dev.func): 00:02.0<br>=C2=A0Fault Reason: 0x6 Fault Info: 6a1=
cea1 Type 1</span></div></code></div><br><div style=3D"background-color: rg=
b(250, 250, 250); border-color: rgb(187, 187, 187); border-style: solid; bo=
rder-width: 1px; overflow-wrap: break-word;" class=3D"prettyprint"><code cl=
ass=3D"prettyprint"><div class=3D"subprettyprint"><span style=3D"color: #00=
0;" class=3D"styled-by-prettify">lspci </span><span style=3D"color: #660;" =
class=3D"styled-by-prettify">-</span><span style=3D"color: #000;" class=3D"=
styled-by-prettify">nnk<br></span><span style=3D"color: #660;" class=3D"sty=
led-by-prettify">...</span><span style=3D"color: #000;" class=3D"styled-by-=
prettify"><br></span><span style=3D"color: #066;" class=3D"styled-by-pretti=
fy">00</span><span style=3D"color: #660;" class=3D"styled-by-prettify">:</s=
pan><span style=3D"color: #066;" class=3D"styled-by-prettify">02.0</span><s=
pan style=3D"color: #000;" class=3D"styled-by-prettify"> VGA compatible con=
troller </span><span style=3D"color: #660;" class=3D"styled-by-prettify">[<=
/span><span style=3D"color: #066;" class=3D"styled-by-prettify">0300</span>=
<span style=3D"color: #660;" class=3D"styled-by-prettify">]:</span><span st=
yle=3D"color: #000;" class=3D"styled-by-prettify"> </span><span style=3D"co=
lor: #606;" class=3D"styled-by-prettify">Intel</span><span style=3D"color: =
#000;" class=3D"styled-by-prettify"> </span><span style=3D"color: #606;" cl=
ass=3D"styled-by-prettify">Corporation</span><span style=3D"color: #000;" c=
lass=3D"styled-by-prettify"> UHD </span><span style=3D"color: #606;" class=
=3D"styled-by-prettify">Graphics</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"> </span><span style=3D"color: #066;" class=3D"style=
d-by-prettify">630</span><span style=3D"color: #000;" class=3D"styled-by-pr=
ettify"> </span><span style=3D"color: #660;" class=3D"styled-by-prettify">(=
</span><span style=3D"color: #606;" class=3D"styled-by-prettify">Desktop</s=
pan><span style=3D"color: #660;" class=3D"styled-by-prettify">)</span><span=
 style=3D"color: #000;" class=3D"styled-by-prettify"> </span><span style=3D=
"color: #660;" class=3D"styled-by-prettify">[</span><span style=3D"color: #=
066;" class=3D"styled-by-prettify">8086</span><span style=3D"color: #660;" =
class=3D"styled-by-prettify">:</span><span style=3D"color: #066;" class=3D"=
styled-by-prettify">3e92</span><span style=3D"color: #660;" class=3D"styled=
-by-prettify">]</span><span style=3D"color: #000;" class=3D"styled-by-prett=
ify"><br>=C2=A0 =C2=A0 </span><span style=3D"color: #606;" class=3D"styled-=
by-prettify">DeviceName</span><span style=3D"color: #660;" class=3D"styled-=
by-prettify">:</span><span style=3D"color: #000;" class=3D"styled-by-pretti=
fy"> </span><span style=3D"color: #606;" class=3D"styled-by-prettify">Onboa=
rd</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> </span>=
<span style=3D"color: #660;" class=3D"styled-by-prettify">-</span><span sty=
le=3D"color: #000;" class=3D"styled-by-prettify"> </span><span style=3D"col=
or: #606;" class=3D"styled-by-prettify">Video</span><span style=3D"color: #=
000;" class=3D"styled-by-prettify"><br>=C2=A0 =C2=A0 </span><span style=3D"=
color: #606;" class=3D"styled-by-prettify">Subsystem</span><span style=3D"c=
olor: #660;" class=3D"styled-by-prettify">:</span><span style=3D"color: #00=
0;" class=3D"styled-by-prettify"> </span><span style=3D"color: #606;" class=
=3D"styled-by-prettify">Dell</span><span style=3D"color: #000;" class=3D"st=
yled-by-prettify"> </span><span style=3D"color: #606;" class=3D"styled-by-p=
rettify">Device</span><span style=3D"color: #000;" class=3D"styled-by-prett=
ify"> </span><span style=3D"color: #660;" class=3D"styled-by-prettify">[</s=
pan><span style=3D"color: #066;" class=3D"styled-by-prettify">1028</span><s=
pan style=3D"color: #660;" class=3D"styled-by-prettify">:</span><span style=
=3D"color: #066;" class=3D"styled-by-prettify">085c</span><span style=3D"co=
lor: #660;" class=3D"styled-by-prettify">]</span><span style=3D"color: #000=
;" class=3D"styled-by-prettify"><br>=C2=A0 =C2=A0 </span><span style=3D"col=
or: #606;" class=3D"styled-by-prettify">Kernel</span><span style=3D"color: =
#000;" class=3D"styled-by-prettify"> driver </span><span style=3D"color: #0=
08;" class=3D"styled-by-prettify">in</span><span style=3D"color: #000;" cla=
ss=3D"styled-by-prettify"> </span><span style=3D"color: #008;" class=3D"sty=
led-by-prettify">use</span><span style=3D"color: #660;" class=3D"styled-by-=
prettify">:</span><span style=3D"color: #000;" class=3D"styled-by-prettify"=
> i915<br>=C2=A0 =C2=A0 </span><span style=3D"color: #606;" class=3D"styled=
-by-prettify">Kernel</span><span style=3D"color: #000;" class=3D"styled-by-=
prettify"> modules</span><span style=3D"color: #660;" class=3D"styled-by-pr=
ettify">:</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> =
i915<br></span></div></code></div><br>Unfortunately I&#39;m not really fami=
liar with VT-d and the Intel virtualization stack in general. Does &quot;Fa=
ult Reason: 0x6&quot; ring a bell to anyone?<br>I&#39;m happy to provide mo=
re information if needed.</div><div><br></div><div>Cheers<br></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/0a31af1e-1735-40c6-920c-5da6a5d1ad99%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/0a31af1e-1735-40c6-920c-5da6a5d1ad99%40googlegroups.com<=
/a>.<br />

------=_Part_3478_1714725465.1581686630002--

------=_Part_3477_625076872.1581686630001
Content-Type: text/x-csrc; charset=US-ASCII; name=dell-optiplex.c
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=dell-optiplex.c
X-Attachment-Id: cf977eef-17f2-4891-91b0-835816f5a8e0
Content-ID: <cf977eef-17f2-4891-91b0-835816f5a8e0>

/*
 * Jailhouse, a Linux-based partitioning hypervisor
 *
 * Copyright (c) Siemens AG, 2014-2017
 *
 * This work is licensed under the terms of the GNU GPL, version 2.  See
 * the COPYING file in the top-level directory.
 *
 * Alternatively, you can use or redistribute this file under the following
 * BSD license:
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 *
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF
 * THE POSSIBILITY OF SUCH DAMAGE.
 *
 * Configuration for Dell Inc. OptiPlex 3060
 * created with '/usr/libexec/jailhouse/jailhouse config create configs/x86/dell-optiplex.c'
 *
 * NOTE: This config expects the following to be appended to your kernel cmdline
 *       "memmap=0x5200000$0x3a000000"
 */

#include <jailhouse/types.h>
#include <jailhouse/cell-config.h>

struct {
	struct jailhouse_system header;
	__u64 cpus[1];
	struct jailhouse_memory mem_regions[50];
	struct jailhouse_irqchip irqchips[1];
	struct jailhouse_pio pio_regions[11];
	struct jailhouse_pci_device pci_devices[16];
	struct jailhouse_pci_capability pci_caps[51];
} __attribute__((packed)) config = {
	.header = {
		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
		.revision = JAILHOUSE_CONFIG_REVISION,
		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
		.hypervisor_memory = {
			.phys_start = 0x3a000000,
			.size = 0x600000,
		},
		.debug_console = {
			.address = 0x3f8,
			.type = JAILHOUSE_CON_TYPE_8250,
			.flags = JAILHOUSE_CON_ACCESS_PIO |
				 JAILHOUSE_CON_REGDIST_1,
		},
		.platform_info = {
			.pci_mmconfig_base = 0xf8000000,
			.pci_mmconfig_end_bus = 0x3f,
			.x86 = {
				.pm_timer_address = 0x1808,
				.vtd_interrupt_limit = 256,
				.iommu_units = {
					{
						.type = JAILHOUSE_IOMMU_INTEL,
						.base = 0xfed90000,
						.size = 0x1000,
					},
					{
						.type = JAILHOUSE_IOMMU_INTEL,
						.base = 0xfed91000,
						.size = 0x1000,
					},
				},
			},
		},
		.root_cell = {
			.name = "RootCell",
			.cpu_set_size = sizeof(config.cpus),
			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
			.num_irqchips = ARRAY_SIZE(config.irqchips),
			.num_pio_regions = ARRAY_SIZE(config.pio_regions),
			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
			.num_pci_caps = ARRAY_SIZE(config.pci_caps),
		},
	},

	.cpus = {
		0x000000000000003f,
	},

	.mem_regions = {
		/* MemRegion: 00000000-0009efff : System RAM */
		{
			.phys_start = 0x0,
			.virt_start = 0x0,
			.size = 0x9f000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 00100000-39ffffff : System RAM */
		{
			.phys_start = 0x100000,
			.virt_start = 0x100000,
			.size = 0x39f00000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 3f200000-a051e017 : System RAM */
		{
			.phys_start = 0x3f200000,
			.virt_start = 0x3f200000,
			.size = 0x6131f000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: a051e018-a053bc57 : System RAM */
		{
			.phys_start = 0xa051e018,
			.virt_start = 0xa051e018,
			.size = 0x1e000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: a053bc58-a2bcafff : System RAM */
		{
			.phys_start = 0xa053bc58,
			.virt_start = 0xa053bc58,
			.size = 0x2690000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: a2bcb000-a2bcbfff : ACPI Non-volatile Storage */
		{
			.phys_start = 0xa2bcb000,
			.virt_start = 0xa2bcb000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: a2bcd000-b2302fff : System RAM */
		{
			.phys_start = 0xa2bcd000,
			.virt_start = 0xa2bcd000,
			.size = 0xf736000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: b238d000-b67cafff : System RAM */
		{
			.phys_start = 0xb238d000,
			.virt_start = 0xb238d000,
			.size = 0x443e000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: b9b0e000-b9b8afff : ACPI Tables */
		{
			.phys_start = 0xb9b0e000,
			.virt_start = 0xb9b0e000,
			.size = 0x7d000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: b9b8b000-ba047fff : ACPI Non-volatile Storage */
		{
			.phys_start = 0xb9b8b000,
			.virt_start = 0xb9b8b000,
			.size = 0x4bd000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: bacff000-bacfffff : System RAM */
		{
			.phys_start = 0xbacff000,
			.virt_start = 0xbacff000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: c0000000-cfffffff : 0000:00:02.0 */
		{
			.phys_start = 0xc0000000,
			.virt_start = 0xc0000000,
			.size = 0x10000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: d0000000-d0ffffff : 0000:00:02.0 */
		{
			.phys_start = 0xd0000000,
			.virt_start = 0xd0000000,
			.size = 0x1000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: d1000000-d10fffff : ICH HD audio */
		{
			.phys_start = 0xd1000000,
			.virt_start = 0xd1000000,
			.size = 0x100000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: d1100000-d1100fff : rtsx_pci */
		{
			.phys_start = 0xd1100000,
			.virt_start = 0xd1100000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: d1201000-d1203fff : 0000:01:00.0 */
		{
			.phys_start = 0xd1201000,
			.virt_start = 0xd1201000,
			.size = 0x3000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: d1204000-d1204fff : r8169 */
		{
			.phys_start = 0xd1204000,
			.virt_start = 0xd1204000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: d1300000-d137ffff : ahci */
		{
			.phys_start = 0xd1300000,
			.virt_start = 0xd1300000,
			.size = 0x80000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: d1380000-d138ffff : xhci-hcd */
		{
			.phys_start = 0xd1380000,
			.virt_start = 0xd1380000,
			.size = 0x10000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: d1391000-d1397fff : ahci */
		{
			.phys_start = 0xd1391000,
			.virt_start = 0xd1391000,
			.size = 0x7000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: d1398000-d139bfff : ICH HD audio */
		{
			.phys_start = 0xd1398000,
			.virt_start = 0xd1398000,
			.size = 0x4000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: d139c000-d139dfff : 0000:00:14.2 */
		{
			.phys_start = 0xd139c000,
			.virt_start = 0xd139c000,
			.size = 0x2000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: d139e000-d139e0ff : 0000:00:1f.4 */
		{
			.phys_start = 0xd139e000,
			.virt_start = 0xd139e000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: d139f000-d139f0ff : ahci */
		{
			.phys_start = 0xd139f000,
			.virt_start = 0xd139f000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: d13a0000-d13a0fff : mei_me */
		{
			.phys_start = 0xd13a0000,
			.virt_start = 0xd13a0000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: d13a1000-d13a1fff : 0000:00:14.2 */
		{
			.phys_start = 0xd13a1000,
			.virt_start = 0xd13a1000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: d13a2000-d13a2fff : Intel PCH thermal driver */
		{
			.phys_start = 0xd13a2000,
			.virt_start = 0xd13a2000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: d13a3000-d13a3fff : 0000:00:08.0 */
		{
			.phys_start = 0xd13a3000,
			.virt_start = 0xd13a3000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fd000000-fd69ffff : pnp 00:06 */
		{
			.phys_start = 0xfd000000,
			.virt_start = 0xfd000000,
			.size = 0x6a0000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fd6a0000-fd6affff : pnp 00:08 */
		{
			.phys_start = 0xfd6a0000,
			.virt_start = 0xfd6a0000,
			.size = 0x10000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fd6b0000-fd6bffff : pnp 00:08 */
		{
			.phys_start = 0xfd6b0000,
			.virt_start = 0xfd6b0000,
			.size = 0x10000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fd6c0000-fd6cffff : pnp 00:06 */
		{
			.phys_start = 0xfd6c0000,
			.virt_start = 0xfd6c0000,
			.size = 0x10000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fd6d0000-fd6dffff : pnp 00:08 */
		{
			.phys_start = 0xfd6d0000,
			.virt_start = 0xfd6d0000,
			.size = 0x10000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fd6e0000-fd6effff : pnp 00:08 */
		{
			.phys_start = 0xfd6e0000,
			.virt_start = 0xfd6e0000,
			.size = 0x10000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fd6f0000-fdffffff : pnp 00:06 */
		{
			.phys_start = 0xfd6f0000,
			.virt_start = 0xfd6f0000,
			.size = 0x910000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fe200000-fe7fffff : pnp 00:06 */
		{
			.phys_start = 0xfe200000,
			.virt_start = 0xfe200000,
			.size = 0x600000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fed00000-fed003ff : PNP0103:00 */
		{
			.phys_start = 0xfed00000,
			.virt_start = 0xfed00000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fed10000-fed17fff : pnp 00:05 */
		{
			.phys_start = 0xfed10000,
			.virt_start = 0xfed10000,
			.size = 0x8000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fed18000-fed18fff : pnp 00:05 */
		{
			.phys_start = 0xfed18000,
			.virt_start = 0xfed18000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fed19000-fed19fff : pnp 00:05 */
		{
			.phys_start = 0xfed19000,
			.virt_start = 0xfed19000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fed20000-fed3ffff : pnp 00:05 */
		{
			.phys_start = 0xfed20000,
			.virt_start = 0xfed20000,
			.size = 0x20000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fed40000-fed44fff : MSFT0101:00 */
		{
			.phys_start = 0xfed40000,
			.virt_start = 0xfed40000,
			.size = 0x5000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fed45000-fed8ffff : pnp 00:05 */
		{
			.phys_start = 0xfed45000,
			.virt_start = 0xfed45000,
			.size = 0x4b000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 100000000-152ffffff : System RAM */
		{
			.phys_start = 0x100000000,
			.virt_start = 0x100000000,
			.size = 0x53000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 153000000-155ffffff : Kernel */
		{
			.phys_start = 0x153000000,
			.virt_start = 0x153000000,
			.size = 0x3000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 156000000-23e7fffff : System RAM */
		{
			.phys_start = 0x156000000,
			.virt_start = 0x156000000,
			.size = 0xe8800000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 23e800000-23fffffff : RAM buffer */
		{
			.phys_start = 0x23e800000,
			.virt_start = 0x23e800000,
			.size = 0x1800000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: ba5f3000-ba83cfff : ACPI DMAR RMRR */
		/* PCI device: 00:14.0 */
		{
			.phys_start = 0xba5f3000,
			.virt_start = 0xba5f3000,
			.size = 0x24a000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: bd000000-bf7fffff : ACPI DMAR RMRR */
		/* PCI device: 00:02.0 */
		{
			.phys_start = 0xbd000000,
			.virt_start = 0xbd000000,
			.size = 0x2800000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 3a600000-3f1fffff : JAILHOUSE Inmate Memory */
		{
			.phys_start = 0x3a600000,
			.virt_start = 0x3a600000,
			.size = 0x4c00000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
	},

	.irqchips = {
		/* IOAPIC 2, GSI base 0 */
		{
			.address = 0xfec00000,
			.id = 0x100f7,
			.pin_bitmap = {
				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff
			},
		},
	},

	.pio_regions = {
		/* Port I/O: 0000-001f : dma1 */
		/* PIO_RANGE(0x0, 0x20), */
		/* Port I/O: 0020-0021 : pic1 */
		/* PIO_RANGE(0x20, 0x2), */
		/* Port I/O: 002e-0031 : iTCO_wdt */
		/* PIO_RANGE(0x2e, 0x4), */
		/* Port I/O: 0040-0043 : timer0 */
		PIO_RANGE(0x40, 0x4),
		/* Port I/O: 0050-0053 : timer1 */
		/* PIO_RANGE(0x50, 0x4), */
		/* Port I/O: 0060-0060 : keyboard */
		PIO_RANGE(0x60, 0x1),
		/* Port I/O: 0064-0064 : keyboard */
		PIO_RANGE(0x64, 0x1),
		/* Port I/O: 0070-0077 : rtc0 */
		PIO_RANGE(0x70, 0x8),
		/* Port I/O: 0080-008f : dma page reg */
		/* PIO_RANGE(0x80, 0x10), */
		/* Port I/O: 00a0-00a1 : pic2 */
		/* PIO_RANGE(0xa0, 0x2), */
		/* Port I/O: 00c0-00df : dma2 */
		/* PIO_RANGE(0xc0, 0x20), */
		/* Port I/O: 00f0-00f0 : PNP0C04:00 */
		/* PIO_RANGE(0xf0, 0x1), */
		/* Port I/O: 03f8-03ff : serial */
		PIO_RANGE(0x3f8, 0x8),
		/* Port I/O: 0400-041f : iTCO_wdt */
		/* PIO_RANGE(0x400, 0x20), */
		/* Port I/O: 0680-069f : pnp 00:02 */
		/* PIO_RANGE(0x680, 0x20), */
		/* Port I/O: 0a00-0a3f : pnp 00:00 */
		/* PIO_RANGE(0xa00, 0x40), */
		/* Port I/O: 0a40-0a7f : pnp 00:00 */
		/* PIO_RANGE(0xa40, 0x40), */
		/* Port I/O: 3000-30ff : 0000:01:00.0 */
		PIO_RANGE(0x3000, 0x100),
		/* Port I/O: 4000-403f : 0000:00:02.0 */
		PIO_RANGE(0x4000, 0x40),
		/* Port I/O: 4060-407f : 0000:00:17.0 */
		PIO_RANGE(0x4060, 0x20),
		/* Port I/O: 4080-4083 : 0000:00:17.0 */
		PIO_RANGE(0x4080, 0x4),
		/* Port I/O: 4090-4097 : 0000:00:17.0 */
		PIO_RANGE(0x4090, 0x8),
		/* Port I/O: efa0-efbf : 0000:00:1f.4 */
		PIO_RANGE(0xefa0, 0x20),
	},

	.pci_devices = {
		/* PCIDevice: 00:00.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x0,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 1,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:02.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x10,
			.bar_mask = {
				0xff000000, 0xffffffff, 0xf0000000,
				0xffffffff, 0xffffffc0, 0x00000000,
			},
			.caps_start = 1,
			.num_caps = 7,
			.num_msi_vectors = 1,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:08.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x40,
			.bar_mask = {
				0xfffff000, 0xffffffff, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 8,
			.num_caps = 3,
			.num_msi_vectors = 1,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:12.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x90,
			.bar_mask = {
				0xfffff000, 0xffffffff, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 11,
			.num_caps = 2,
			.num_msi_vectors = 1,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:14.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xa0,
			.bar_mask = {
				0xffff0000, 0xffffffff, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 13,
			.num_caps = 3,
			.num_msi_vectors = 8,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:14.2 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xa2,
			.bar_mask = {
				0xffffe000, 0xffffffff, 0xfffff000,
				0xffffffff, 0x00000000, 0x00000000,
			},
			.caps_start = 16,
			.num_caps = 1,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:16.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xb0,
			.bar_mask = {
				0xfffff000, 0xffffffff, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 17,
			.num_caps = 3,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:17.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xb8,
			.bar_mask = {
				0xffff8000, 0xffffff00, 0xfffffff8,
				0xfffffffc, 0xffffffe0, 0xfff80000,
			},
			.caps_start = 20,
			.num_caps = 3,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 1,
			.msix_region_size = 0x1000,
			.msix_address = 0xd1390000,
		},
		/* PCIDevice: 00:1c.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xe0,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 23,
			.num_caps = 9,
			.num_msi_vectors = 1,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:1c.5 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xe5,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 23,
			.num_caps = 9,
			.num_msi_vectors = 1,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:1f.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xf8,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:1f.3 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xfb,
			.bar_mask = {
				0xffffc000, 0xffffffff, 0x00000000,
				0x00000000, 0xfff00000, 0xffffffff,
			},
			.caps_start = 32,
			.num_caps = 3,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:1f.4 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xfc,
			.bar_mask = {
				0xffffff00, 0xffffffff, 0x00000000,
				0x00000000, 0xffffffe0, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:1f.5 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xfd,
			.bar_mask = {
				0xfffff000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 01:00.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x100,
			.bar_mask = {
				0xffffff00, 0x00000000, 0xfffff000,
				0xffffffff, 0xffffc000, 0xffffffff,
			},
			.caps_start = 35,
			.num_caps = 9,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 4,
			.msix_region_size = 0x1000,
			.msix_address = 0xd1200000,
		},
		/* PCIDevice: 02:00.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x200,
			.bar_mask = {
				0x00000000, 0xfffff000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 44,
			.num_caps = 7,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
	},

	.pci_caps = {
		/* PCIDevice: 00:00.0 */
		{
			.id = PCI_CAP_ID_VNDR,
			.start = 0xe0,
			.len = 0x2,
			.flags = 0,
		},
		/* PCIDevice: 00:02.0 */
		{
			.id = PCI_CAP_ID_VNDR,
			.start = 0x40,
			.len = 0x2,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_EXP,
			.start = 0x70,
			.len = 0x3c,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0xac,
			.len = 0xa,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_PM,
			.start = 0xd0,
			.len = 0x8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_EXT_CAP_ID_PASID | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x100,
			.len = 0x8,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_ATS | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x200,
			.len = 0x4,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_PRI | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x300,
			.len = 0x4,
			.flags = 0,
		},
		/* PCIDevice: 00:08.0 */
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0x90,
			.len = 0xa,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_PM,
			.start = 0xdc,
			.len = 0x8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_AF,
			.start = 0xf0,
			.len = 0x2,
			.flags = 0,
		},
		/* PCIDevice: 00:12.0 */
		{
			.id = PCI_CAP_ID_PM,
			.start = 0x50,
			.len = 0x8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0x80,
			.len = 0xa,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		/* PCIDevice: 00:14.0 */
		{
			.id = PCI_CAP_ID_PM,
			.start = 0x70,
			.len = 0x8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0x80,
			.len = 0xe,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_VNDR,
			.start = 0x90,
			.len = 0x2,
			.flags = 0,
		},
		/* PCIDevice: 00:14.2 */
		{
			.id = PCI_CAP_ID_PM,
			.start = 0x80,
			.len = 0x8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		/* PCIDevice: 00:16.0 */
		{
			.id = PCI_CAP_ID_PM,
			.start = 0x50,
			.len = 0x8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0x8c,
			.len = 0xe,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_VNDR,
			.start = 0xa4,
			.len = 0x2,
			.flags = 0,
		},
		/* PCIDevice: 00:17.0 */
		{
			.id = PCI_CAP_ID_MSIX,
			.start = 0xd0,
			.len = 0xc,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_PM,
			.start = 0x70,
			.len = 0x8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_SATA,
			.start = 0xa8,
			.len = 0x2,
			.flags = 0,
		},
		/* PCIDevice: 00:1c.0 */
		/* PCIDevice: 00:1c.5 */
		{
			.id = PCI_CAP_ID_EXP,
			.start = 0x40,
			.len = 0x3c,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0x80,
			.len = 0xa,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_SSVID,
			.start = 0x90,
			.len = 0x2,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_PM,
			.start = 0xa0,
			.len = 0x8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_EXT_CAP_ID_ERR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x100,
			.len = 0x40,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_ACS | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x140,
			.len = 0x8,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_PTM | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x150,
			.len = 0xc,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_L1SS | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x200,
			.len = 0x4,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_DPC | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x250,
			.len = 0x4,
			.flags = 0,
		},
		/* PCIDevice: 00:1f.3 */
		{
			.id = PCI_CAP_ID_PM,
			.start = 0x50,
			.len = 0x8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_VNDR,
			.start = 0x80,
			.len = 0x2,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0x60,
			.len = 0xe,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		/* PCIDevice: 01:00.0 */
		{
			.id = PCI_CAP_ID_PM,
			.start = 0x40,
			.len = 0x8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0x50,
			.len = 0xe,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_EXP,
			.start = 0x70,
			.len = 0x3c,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_MSIX,
			.start = 0xb0,
			.len = 0xc,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_EXT_CAP_ID_ERR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x100,
			.len = 0x40,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_VC | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x140,
			.len = 0x10,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_DSN | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x160,
			.len = 0xc,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_LTR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x170,
			.len = 0x8,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_L1SS | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x178,
			.len = 0x4,
			.flags = 0,
		},
		/* PCIDevice: 02:00.0 */
		{
			.id = PCI_CAP_ID_PM,
			.start = 0x80,
			.len = 0x8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0x90,
			.len = 0xe,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_EXP,
			.start = 0xb0,
			.len = 0x3c,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_ERR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x100,
			.len = 0x40,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_DSN | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x148,
			.len = 0xc,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_LTR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x158,
			.len = 0x8,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_L1SS | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x160,
			.len = 0x4,
			.flags = 0,
		},
	},
};

------=_Part_3477_625076872.1581686630001--
