Return-Path: <jailhouse-dev+bncBC74HBERSAORB7OD4D3AKGQEVIQANFQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x337.google.com (mail-ot1-x337.google.com [IPv6:2607:f8b0:4864:20::337])
	by mail.lfdr.de (Postfix) with ESMTPS id 1221D1ED883
	for <lists+jailhouse-dev@lfdr.de>; Thu,  4 Jun 2020 00:19:43 +0200 (CEST)
Received: by mail-ot1-x337.google.com with SMTP id n51sf2193207ota.0
        for <lists+jailhouse-dev@lfdr.de>; Wed, 03 Jun 2020 15:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=rJiaXHPw9FDfCMDdyNLEWnQ33XAckNGRkKT562F7it4=;
        b=MVOu+9BYX+oJibLaJxYmEM3iMKroYl4cO4mYbFd9ilXNbDBCZIwY34N8TmJCiu2YCr
         v9edALM5Z8WL3uq+JKZQB6BU9fsrn4vCIgHDuY8MK28vXOFGVqsA1EwwHUk+IDe4Wwf5
         iOGoOempjI8B6tOdHneZDRYtqj88mJ5DczcdQ0wU/0tZUmq8vIas+7+SRkI11Cx/PwnB
         QJXoO+3Hcl9avkVO5mwckeZhhQxtlsyEEo6qNhO+fV4LLjqlkrsRgpJYUOSRXd8cwQK4
         yAJkoV/gu8b/pI0lpiQbMxz3RjtUelEjF+tc0aeet5p2ePE/Hs1+AqlXNWEo8rjEkSQ4
         h4bQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=rJiaXHPw9FDfCMDdyNLEWnQ33XAckNGRkKT562F7it4=;
        b=cCnbeDG9TRsJxZVltjdvrhlGq0FQyku+J5G4y0a6hx2FYtFWBK0omEst7SKohU6SGD
         p07IJTJMrosm+5UZ/VP2hOqINKScMVnw4u9E1vGoFBtpHUc0Jr2Z9JVmBYvn2KbDL3Od
         2QzXX8JBj7FP+QREQeZH2kAtDXF0y/pa4xzLWcROTH/OHE+OikZVOogsgd9+lVDYTJnW
         RVuXNnF7sRRG7hyuoszLm/sv6iYZhx7iU0NVoyGkcwyMajlygufj3RRonzbHhEY5v9rS
         NgGK9+TFrq7UfdXQTqUyYXviltSh3rxBWXBqjY/Xkx1j78+TUsE36IOAnMeuDCNDuMZz
         4mTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=rJiaXHPw9FDfCMDdyNLEWnQ33XAckNGRkKT562F7it4=;
        b=QQVVkgmHYZ298lA+ulPvqpU08PZOLLPJ3YqpaAEi+nSfxzD27ehgE59HKDg0hDv2YO
         gHRYIW+sT/b9kNXQsu5JrXGv7f+DBOAffXl8MIbBchOzQ+big1/tpz5lDTIlBtfDpQSD
         CRj4/9bgc6elmhZsGom4ODSKRlI+IKoM2vX9HRK88NPNx4VQ2F+2uBYKzrCzqw/DrZw6
         JhnTdYHIytvxz5afcAOBsl0hTSWCIaKbnKQWmLIW0aj2ZZBdu6ScgrFX9eyxPonSOJKt
         6TtspmM/tiJISP6KgBSo8NpLe552pTsZOLWuFlXFnrzqjZ/TcIMIg+PglDSX4kZRsYI3
         UN/g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5321b58euBs6UMUCMcTki5rKnlP423QpRIgEHbvdxxzNLp9silmp
	Xf516Cn79WDOEV9kb0/jRbc=
X-Google-Smtp-Source: ABdhPJx/Qd6sCqCVMvS8js+zeKm7RDqPGYRfFnCnWp6hJttadRoehcgd5ow51Zi7tRD3GpTCi676Qw==
X-Received: by 2002:aca:f083:: with SMTP id o125mr1245261oih.19.1591222782002;
        Wed, 03 Jun 2020 15:19:42 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a4a:dd98:: with SMTP id h24ls248530oov.5.gmail; Wed, 03 Jun
 2020 15:19:41 -0700 (PDT)
X-Received: by 2002:a4a:d043:: with SMTP id x3mr1599503oor.17.1591222781411;
        Wed, 03 Jun 2020 15:19:41 -0700 (PDT)
Date: Wed, 3 Jun 2020 15:19:40 -0700 (PDT)
From: jorgeluis.martinezgarcia2@gmail.com
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <ed5c9386-c34b-46d8-ae34-fd9f4f416ae8@googlegroups.com>
In-Reply-To: <5dca1eee81cd46218983e92131d9a31a@tum.de>
References: <5dca1eee81cd46218983e92131d9a31a@tum.de>
Subject: Re: ZCU102 ZynqMP Ultrascale+
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_478_1701151622.1591222780510"
X-Original-Sender: jorgeluis.martinezgarcia2@gmail.com
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

------=_Part_478_1701151622.1591222780510
Content-Type: multipart/alternative; 
	boundary="----=_Part_479_1714540717.1591222780510"

------=_Part_479_1714540717.1591222780510
Content-Type: text/plain; charset="UTF-8"

Hi, 
I forgot to mention that I am using Jailhouse v0.9.1 and hence the actual 
config and dts files are 
https://github.com/siemens/jailhouse/blob/v0.9.1/configs/arm64/dts/inmate-zynqmp-zcu102-2.dts 
and 
https://github.com/siemens/jailhouse/blob/v0.9.1/configs/arm64/zynqmp-zcu102-linux-demo-2.c.

Jorge

On Thursday, June 4, 2020 at 12:05:23 AM UTC+2, Martinez Garcia, Jorge Luis 
wrote:
>
> Dear all, 
>
> I am trying to have three Linux instances on the ZCU102 ZynqMP Ultrascale+ 
> (The root cell and two guests). I followed the steps specified in 
> https://github.com/siemens/jailhouse/blob/master/Documentation/setup-on-zynqmp-zcu102.md 
> and have two Linux instances successfully running on the board. However, 
> when adding a third Linux guest, I do not see the kernel booting in the 
> Jailhouse console:
>
>
> root@xilinx-zcu102-2018_3:~/LinuxGuest2# jailhouse cell linux 
> zynqmp-zcu102-linux-demo-2.cell Image -d inmate-zynqmp-zcu102-2.dtb -i 
> rootfs.cpio -c "console=jailhouse,115200"
>
> root@xilinx-zcu102-2018_3:~/LinuxGuest2# jailhouse console -f
>
> Adding virtual PCI device 00:02.0 to cell "ZynqMP-linux-demo-2"
> Shared memory connection established: "ZynqMP-linux-demo-2" <--> 
> "ZynqMP-linux-demo"
> Created cell "ZynqMP-linux-demo-2"
> Page pool usage after cell creation: mem 77/995, remap 69/131072
> Cell "ZynqMP-linux-demo-2" can be loaded
> Started cell "ZynqMP-linux-demo-2"
>
>
> root@xilinx-zcu102-2018_3:~/LinuxGuest2# jailhouse cell list
> ID      Name                    State             Assigned CPUs           
> Failed CPUs             
> 0       ZynqMP-ZCU102           running           
> 0                                               
> 1       ZynqMP-linux-demo       running           
> 2-3                                             
> 2       ZynqMP-linux-demo-2     running           1 
>
> The config file of ZynqMP-linux-demo-2 is 
> https://github.com/siemens/jailhouse/blob/master/configs/arm64/zynqmp-zcu102-linux-demo-2.c 
> (as you can see the flag JAILHOUSE_CELL_DEBUG_CONSOLE is present)
>
> and its corresponding dts file is 
> https://github.com/siemens/jailhouse/blob/master/configs/arm64/dts/inmate-zynqmp-zcu102-2.dts
>
>
> While the three instances are supposed to be running, as shown by jailhouse 
> cell list, I do not see the third Linux booting. Has any of you faced a 
> similar issue? 
>
>
> Jorge
>
>
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/ed5c9386-c34b-46d8-ae34-fd9f4f416ae8%40googlegroups.com.

------=_Part_479_1714540717.1591222780510
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi, <br></div><div>I forgot to mention that I am usin=
g Jailhouse v0.9.1 and hence the actual config and dts files are https://gi=
thub.com/siemens/jailhouse/blob/v0.9.1/configs/arm64/dts/inmate-zynqmp-zcu1=
02-2.dts and https://github.com/siemens/jailhouse/blob/v0.9.1/configs/arm64=
/zynqmp-zcu102-linux-demo-2.c.<br></div><div><br></div><div>Jorge</div><div=
><br></div>On Thursday, June 4, 2020 at 12:05:23 AM UTC+2, Martinez Garcia,=
 Jorge Luis wrote:<blockquote class=3D"gmail_quote" style=3D"margin: 0;marg=
in-left: 0.8ex;border-left: 1px #ccc solid;padding-left: 1ex;">




<div dir=3D"ltr">
<div style=3D"font-size:12pt;color:#000000;font-family:Calibri,Helvetica,sa=
ns-serif" dir=3D"ltr">
<p>Dear all, <br>
</p>
<p>I am trying to have three Linux instances on the <span>ZCU102 ZynqMP Ult=
rascale+</span> (The root cell and two guests). I followed the steps specif=
ied in
<a href=3D"https://github.com/siemens/jailhouse/blob/master/Documentation/s=
etup-on-zynqmp-zcu102.md" target=3D"_blank" rel=3D"nofollow" onmousedown=3D=
"this.href=3D&#39;https://www.google.com/url?q\x3dhttps%3A%2F%2Fgithub.com%=
2Fsiemens%2Fjailhouse%2Fblob%2Fmaster%2FDocumentation%2Fsetup-on-zynqmp-zcu=
102.md\x26sa\x3dD\x26sntz\x3d1\x26usg\x3dAFQjCNHI_KgzVkJ9KdafY-Z5aCcbY8pEhg=
&#39;;return true;" onclick=3D"this.href=3D&#39;https://www.google.com/url?=
q\x3dhttps%3A%2F%2Fgithub.com%2Fsiemens%2Fjailhouse%2Fblob%2Fmaster%2FDocum=
entation%2Fsetup-on-zynqmp-zcu102.md\x26sa\x3dD\x26sntz\x3d1\x26usg\x3dAFQj=
CNHI_KgzVkJ9KdafY-Z5aCcbY8pEhg&#39;;return true;">
https://github.com/siemens/<wbr>jailhouse/blob/master/<wbr>Documentation/se=
tup-on-zynqmp-<wbr>zcu102.md</a> and have two Linux instances successfully =
running on the board. However, when adding a third Linux guest, I do not se=
e the kernel booting in the Jailhouse console:</p>
<p><br>
</p>
<p></p>
<div>root@xilinx-zcu102-2018_3:~/<wbr>LinuxGuest2# jailhouse cell linux zyn=
qmp-zcu102-linux-demo-2.<wbr>cell Image -d inmate-zynqmp-zcu102-2.dtb -i ro=
otfs.cpio -c &quot;console=3Djailhouse,115200&quot;</div>
<div><br>
</div>
<div>root@xilinx-zcu102-2018_3:~/<wbr>LinuxGuest2# jailhouse console -f<br>
</div>
<p></p>
<p></p>
<div>Adding virtual PCI device 00:02.0 to cell &quot;ZynqMP-linux-demo-2&qu=
ot;<br>
Shared memory connection established: &quot;ZynqMP-linux-demo-2&quot; &lt;-=
-&gt; &quot;ZynqMP-linux-demo&quot;<br>
Created cell &quot;ZynqMP-linux-demo-2&quot;<br>
Page pool usage after cell creation: mem 77/995, remap 69/131072<br>
Cell &quot;ZynqMP-linux-demo-2&quot; can be loaded<br>
Started cell &quot;ZynqMP-linux-demo-2&quot;<br>
</div>
<div><br>
</div>
<div><br>
<div>root@xilinx-zcu102-2018_3:~/<wbr>LinuxGuest2# jailhouse cell list<br>
ID=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Name=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 State=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 Assigned CPUs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 Failed CPUs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 =C2=A0<br>
0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ZynqMP-ZCU102=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 running=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<wbr>=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 =C2=A0<br>
1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ZynqMP-linux-demo=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 running=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 2-3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<wbr>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0<br>
2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ZynqMP-linux-demo-2=C2=A0=C2=A0=C2=A0=
=C2=A0 running=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
1 <br>
</div>
<br>
</div>
<p>The config file of=C2=A0<span>ZynqMP-linux-demo-2</span> is=C2=A0<span><=
a href=3D"https://github.com/siemens/jailhouse/blob/master/configs/arm64/zy=
nqmp-zcu102-linux-demo-2.c" target=3D"_blank" rel=3D"nofollow" onmousedown=
=3D"this.href=3D&#39;https://www.google.com/url?q\x3dhttps%3A%2F%2Fgithub.c=
om%2Fsiemens%2Fjailhouse%2Fblob%2Fmaster%2Fconfigs%2Farm64%2Fzynqmp-zcu102-=
linux-demo-2.c\x26sa\x3dD\x26sntz\x3d1\x26usg\x3dAFQjCNEEbdo2qPTCwSko2nJlp5=
OK0736fg&#39;;return true;" onclick=3D"this.href=3D&#39;https://www.google.=
com/url?q\x3dhttps%3A%2F%2Fgithub.com%2Fsiemens%2Fjailhouse%2Fblob%2Fmaster=
%2Fconfigs%2Farm64%2Fzynqmp-zcu102-linux-demo-2.c\x26sa\x3dD\x26sntz\x3d1\x=
26usg\x3dAFQjCNEEbdo2qPTCwSko2nJlp5OK0736fg&#39;;return true;">https://gith=
ub.com/siemens/<wbr>jailhouse/blob/master/configs/<wbr>arm64/zynqmp-zcu102-=
linux-<wbr>demo-2.c</a>
 (as you can see the flag JAILHOUSE_CELL_DEBUG_CONSOLE is present)<br>
</span></p>
<p></p>
<p><span>and its corresponding dts file is <a href=3D"https://github.com/si=
emens/jailhouse/blob/master/configs/arm64/dts/inmate-zynqmp-zcu102-2.dts" t=
arget=3D"_blank" rel=3D"nofollow" onmousedown=3D"this.href=3D&#39;https://w=
ww.google.com/url?q\x3dhttps%3A%2F%2Fgithub.com%2Fsiemens%2Fjailhouse%2Fblo=
b%2Fmaster%2Fconfigs%2Farm64%2Fdts%2Finmate-zynqmp-zcu102-2.dts\x26sa\x3dD\=
x26sntz\x3d1\x26usg\x3dAFQjCNGpf6dl8H0whDrRpe6itC04fJAI7Q&#39;;return true;=
" onclick=3D"this.href=3D&#39;https://www.google.com/url?q\x3dhttps%3A%2F%2=
Fgithub.com%2Fsiemens%2Fjailhouse%2Fblob%2Fmaster%2Fconfigs%2Farm64%2Fdts%2=
Finmate-zynqmp-zcu102-2.dts\x26sa\x3dD\x26sntz\x3d1\x26usg\x3dAFQjCNGpf6dl8=
H0whDrRpe6itC04fJAI7Q&#39;;return true;">
https://github.com/siemens/<wbr>jailhouse/blob/master/configs/<wbr>arm64/dt=
s/inmate-zynqmp-<wbr>zcu102-2.dts</a></span><br>
</p>
<p><br>
</p>
<p>While the three instances are supposed to be running, as shown by <span>=
jailhouse cell list</span>, I do not see the third Linux booting. Has any o=
f you faced a similar issue?
<br>
</p>
<p><br>
</p>
<p>Jorge</p>
<p><br>
</p>
</div>
</div>

</blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/ed5c9386-c34b-46d8-ae34-fd9f4f416ae8%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/ed5c9386-c34b-46d8-ae34-fd9f4f416ae8%40googlegroups.com<=
/a>.<br />

------=_Part_479_1714540717.1591222780510--

------=_Part_478_1701151622.1591222780510--
