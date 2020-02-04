Return-Path: <jailhouse-dev+bncBCPOXAO4SYIBBPN24TYQKGQEWS3KASQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x33a.google.com (mail-ot1-x33a.google.com [IPv6:2607:f8b0:4864:20::33a])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CBBE151676
	for <lists+jailhouse-dev@lfdr.de>; Tue,  4 Feb 2020 08:29:03 +0100 (CET)
Received: by mail-ot1-x33a.google.com with SMTP id m18sf10558012otp.20
        for <lists+jailhouse-dev@lfdr.de>; Mon, 03 Feb 2020 23:29:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=I4PtPGXaozyREanpu1Ihvne7W4sJcZs7bTHGWVVXxec=;
        b=Pu28nZZS4WYr6leckOQ3CFty4cz+s8by2wu21ZVJJwhtLpnQjvguwdO3PaJGDSonAx
         Ac7887ynY9CPR3t+fUDNpWHK2eb6GJw0G1EUXkLQtCNKjkOM5K4rWSLCLWLjPC/6G8yY
         lwrcl4EGNOz4NC1l2d3ISCT9zj9q8Vmu5O+MecZCRJkQTyD7H6nAhPsQmDRcJlsAs3R4
         UAcoBoT3bOqpRg+YlajlcYJfo22VQcq3sMbrbP1WwDRkvOgEPBLkcfUTQwP0v+een/vn
         X35rZ+qhD3S8vhaGA7gRUUgpuqYwO8PzYkrC1H1rGQamC70CDafDqD+q5TwKCmsdvBMf
         8ICg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=I4PtPGXaozyREanpu1Ihvne7W4sJcZs7bTHGWVVXxec=;
        b=MXl+1OQfTtW8gnO+hJgVCp+E1pwyVPc6GtCe6zfYCva6xOcD3nZ9yPtwTYmq+zhF/M
         GG6Hxsb+5xr3vHn6uV5dcWWYjYtrRmiuaIG+iHLhXhBosP1Oej+GVe5f0Ykd9W7mHGkY
         kEkmV9uY/n/Nm7J1BqhTI7VJUCJHEgYSkELuvtZzi6VGBJnRPLgstJLCFyK+DPmpbNFy
         RRLvqZoxPhd1MgP5l7Zzc86Nazt8zJbEaYMGfaHpDohjEtRn3AR0OfNyDVCJ0eyXg4mL
         UGMCNX2iVBnw3Y/4ggMzOkJzyvDXBxDhbTZ3vrCkD3edl+bDQKINFweyX2YWycuhSvHz
         cYBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=I4PtPGXaozyREanpu1Ihvne7W4sJcZs7bTHGWVVXxec=;
        b=cu4fO/1e3daziVOv6DnBd1WiihS+scF2/Z17IRbyTUOl4AQQLHg1KtSfD1ExZlJDGa
         wQuS66tyOQ5dvUzKAk2xmrDk+RSATJ/teFhmLAoSn4f9ra9UWBHM/qWXWR17mG0xGIrh
         9tRWRL/AXZTISiDLZtja1KJ+91DpVMFxOA+XUOQZbh/T2PaM4gqDKqqdm9E0p3g9rIRB
         EPZzlrQtLLOPUafDoZS7JqX65dxOJ9SY+bZMovsBrVTX7qkT3gvzloRMvyCup1tDHCal
         PF0va/+kuaHvNyEvwCAbAiSCk7ozoofyz9J7VeFU10LLknS4NZIyhaEUDmXh0FhuqYuA
         UC8A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVFpMiVL2Mo7W5xL9Va3hINokdXPYAVUcg3xtsTMZDXr9LQh8QQ
	JBF3BsCiNvy9eMhtHjEUHPU=
X-Google-Smtp-Source: APXvYqxZ+OxkkjVoHUmjOopUOdi9A5bLM2ER0wNBkLB7Z92Ce6ex1MKb0wWDPeTombQq7LbeYgXw7w==
X-Received: by 2002:aca:1c09:: with SMTP id c9mr2617534oic.85.1580801342096;
        Mon, 03 Feb 2020 23:29:02 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:5a87:: with SMTP id w7ls583520oth.1.gmail; Mon, 03 Feb
 2020 23:29:01 -0800 (PST)
X-Received: by 2002:a9d:7508:: with SMTP id r8mr21113667otk.116.1580801341303;
        Mon, 03 Feb 2020 23:29:01 -0800 (PST)
Date: Mon, 3 Feb 2020 23:29:00 -0800 (PST)
From: vijai kumar <vijaikumar.kanagarajan@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <abd4da70-a975-42b2-b9aa-b2d3d0c7bf01@googlegroups.com>
Subject: ivshmem demo exception on pine64
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_256_1293231061.1580801340799"
X-Original-Sender: vijaikumar.kanagarajan@gmail.com
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

------=_Part_256_1293231061.1580801340799
Content-Type: multipart/alternative; 
	boundary="----=_Part_257_575099183.1580801340800"

------=_Part_257_575099183.1580801340800
Content-Type: text/plain; charset="UTF-8"

Hi All,

I was working on integrating the necessary changes for ivshmem demo for 
Pine64 board that I have. But when I load and start ivshmem-demo.bin I am 
hit
with the following exception. Any pointers on what it could be?

Parking CPU 1 (Cell: "inmate-demo")
Unhandled data read at 0x2100000(2)

FATAL: unhandled trap (exception class 0x24)
Cell state before exception:
 pc: 00000000000053e0   lr: 0000000000004824 spsr: 60000005     EL1
 sp: 0000000000007f90  esr: 24 1 1400006
 x0: 0000000002000000   x1: 0000000000100000   x2: 0000000000000002
 x3: 0000000000000069   x4: 0000000000000000   x5: 0000000000000000
 x6: 0000000000001000   x7: 0000000000000000   x8: 0000000000000000
 x9: 0000000000000000  x10: 0000000000000000  x11: 0000000000000000
x12: 0000000000000000  x13: 0000000000000000  x14: 0000000000000000
x15: 0000000000000000  x16: 0000000000000000  x17: 0000000000000000
x18: 0000000000000000  x19: 0000000000000100  x20: 000000000000ffff
x21: 000000000000110a  x22: 0000000000004106  x23: 0000000000000100
x24: 0000000000000000  x25: 0000000000000000  x26: 0000000000000000
x27: 0000000000000000  x28: 0000000000000000  x29: 0000000000000000

My pci_mmconfig_base is 0x02000000

Thanks,
Vijai Kumar K

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/abd4da70-a975-42b2-b9aa-b2d3d0c7bf01%40googlegroups.com.

------=_Part_257_575099183.1580801340800
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi All,</div><div><br></div><div>I was working on int=
egrating the necessary changes for ivshmem demo for Pine64 board that I hav=
e. But when I load and start ivshmem-demo.bin I am hit</div><div>with the f=
ollowing exception. Any pointers on what it could be?</div><div><br></div>P=
arking CPU 1 (Cell: &quot;inmate-demo&quot;)<br>Unhandled data read at 0x21=
00000(2)<br><br>FATAL: unhandled trap (exception class 0x24)<br>Cell state =
before exception:<br>=C2=A0pc: 00000000000053e0=C2=A0=C2=A0 lr: 00000000000=
04824 spsr: 60000005=C2=A0=C2=A0=C2=A0=C2=A0 EL1<br>=C2=A0sp: 0000000000007=
f90=C2=A0 esr: 24 1 1400006<br>=C2=A0x0: 0000000002000000=C2=A0=C2=A0 x1: 0=
000000000100000=C2=A0=C2=A0 x2: 0000000000000002<br>=C2=A0x3: 0000000000000=
069=C2=A0=C2=A0 x4: 0000000000000000=C2=A0=C2=A0 x5: 0000000000000000<br>=
=C2=A0x6: 0000000000001000=C2=A0=C2=A0 x7: 0000000000000000=C2=A0=C2=A0 x8:=
 0000000000000000<br>=C2=A0x9: 0000000000000000=C2=A0 x10: 0000000000000000=
=C2=A0 x11: 0000000000000000<br>x12: 0000000000000000=C2=A0 x13: 0000000000=
000000=C2=A0 x14: 0000000000000000<br>x15: 0000000000000000=C2=A0 x16: 0000=
000000000000=C2=A0 x17: 0000000000000000<br>x18: 0000000000000000=C2=A0 x19=
: 0000000000000100=C2=A0 x20: 000000000000ffff<br>x21: 000000000000110a=C2=
=A0 x22: 0000000000004106=C2=A0 x23: 0000000000000100<br>x24: 0000000000000=
000=C2=A0 x25: 0000000000000000=C2=A0 x26: 0000000000000000<br>x27: 0000000=
000000000=C2=A0 x28: 0000000000000000=C2=A0 x29: 0000000000000000<br><div><=
br></div><div>My pci_mmconfig_base is 0x02000000<br></div><div><br></div><d=
iv>Thanks,</div><div>Vijai Kumar K<br></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/abd4da70-a975-42b2-b9aa-b2d3d0c7bf01%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/abd4da70-a975-42b2-b9aa-b2d3d0c7bf01%40googlegroups.com<=
/a>.<br />

------=_Part_257_575099183.1580801340800--

------=_Part_256_1293231061.1580801340799--
