Return-Path: <jailhouse-dev+bncBC7PTOEB2ALRBQNR32AQMGQESSBCYWI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qv1-xf38.google.com (mail-qv1-xf38.google.com [IPv6:2607:f8b0:4864:20::f38])
	by mail.lfdr.de (Postfix) with ESMTPS id E9BA7324FDC
	for <lists+jailhouse-dev@lfdr.de>; Thu, 25 Feb 2021 13:32:02 +0100 (CET)
Received: by mail-qv1-xf38.google.com with SMTP id d15sf3958375qvn.16
        for <lists+jailhouse-dev@lfdr.de>; Thu, 25 Feb 2021 04:32:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=UNB2Uj9FyFlj2sQo/3lTDOQ3y2R+p40OPl5lQM+S+oo=;
        b=DPkWzekquVW4Ge7SAiFqYilc7AMF1yk+/XGpV0r/E1UzRlywVrVC2zy13rGI/N2NkG
         DTHMrz68p55A/ts2m1uxgbaaGvoox0O2m0dxmgejsK45qQsg6gcSFgKaxq3t9M6I6D0q
         ActdzNdaSajVpDd+wFpJkotThkVPRqoLccx++eEyW7d6aSKJKnmjc98Xtnf2DO+zECXb
         O3Zj7ch6FZxMCBdXd0qt1Ab/+2WWJylC9cDaqUrHjzucXJb+f9B4IMxjRW8gi9KtItN4
         Qn2eD8RuhISJqAUvjideEFMCauAJmuX+VGVH3VGyT6xlpjPr/4yEaCQKL4T02sQ7Oet8
         Md4w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=UNB2Uj9FyFlj2sQo/3lTDOQ3y2R+p40OPl5lQM+S+oo=;
        b=iiJm7LeOOJRB8KoeTW3rnJdB8yMYf97K3AsSfTWAInSM4l4ZsH50/AfbojW2Enpx79
         lcuBbph/cou9smY034K9v3+5s3dYaPDejfasVYb5qeBoKKl2Aj8QiLzhL8WxppmsDCRg
         i4cV5haqhGXRzCO0CK1ou6hgq+KTrNukzea2KzyuQn6q5CSBKoML+NdXLjIrkuaaYp9s
         XBYz8XTf35ouLERJi1xhYpAhH+abMHo+11UjU79HnaB7D7UFMZizEmkwkNyNxeqHxeBQ
         tWJWG6V4lA5Jrl5tZ1WQoS6B9bwsGb4+wRgIl6cd7kjbf1cQQMStRdHwyKdkAjmBGa8m
         TxmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=UNB2Uj9FyFlj2sQo/3lTDOQ3y2R+p40OPl5lQM+S+oo=;
        b=uX5WogkbLqBK3lr7ZDf66nqZDfdqXKmWlrasMrnSfjVcXbRTKeph6C0R9/oGYK/4dv
         o/7OboJnhuHc9USLCrKL2/nEtn6kVp36Fkap1t2A0L/oINB4oIoatUDg09C/o4lVzROl
         PzS89VNzNZEBTn835qS4cTOlZe4be29v5qTYTmmM4gCrGbspuqxVCcxSfxPWcqiMr3IO
         0uHaGj+YXQHrecCWdMVLKlM9SOTShT0Eo413ukPq/AXaAuvNPuGPEIKKl4yo7S2GO6Xk
         S1u/sap/aEx9212gUYvArjC7R8lC1dMnIuIZVEe01conoqfwwGjbGmUftVKxp0gX2jeT
         5RTg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533nqCegmuLXKe1ER4J68V6GaBqkd9pv9LsUKFO3GxSzKbLDIhkC
	9I8oqLuYb7eoIDrM/tdfhrg=
X-Google-Smtp-Source: ABdhPJzZCQnNvIeT37vIa71KPh3B1tJEN9q7ToF9kB0PPgmS5xS24izpoI8Bos9JPNFfkqHO0XY9fw==
X-Received: by 2002:a05:6214:bce:: with SMTP id ff14mr2301583qvb.26.1614256321923;
        Thu, 25 Feb 2021 04:32:01 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:622a:d2:: with SMTP id p18ls2073192qtw.3.gmail; Thu, 25
 Feb 2021 04:32:01 -0800 (PST)
X-Received: by 2002:ac8:1494:: with SMTP id l20mr2144487qtj.151.1614256321319;
        Thu, 25 Feb 2021 04:32:01 -0800 (PST)
Date: Thu, 25 Feb 2021 04:32:00 -0800 (PST)
From: Smith li <v6543210@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <254a573f-0b4a-4c6e-a5d5-19d0734cf6ebn@googlegroups.com>
Subject: how to run linux with root in none root cell ?
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_2496_156407620.1614256320777"
X-Original-Sender: v6543210@gmail.com
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

------=_Part_2496_156407620.1614256320777
Content-Type: multipart/alternative; 
	boundary="----=_Part_2497_1759639359.1614256320777"

------=_Part_2497_1759639359.1614256320777
Content-Type: text/plain; charset="UTF-8"

Dear Community,
        I have compile the jailhouse-images repository, and run the demo.

  the command to start linux in a cell is like this:

#jailhouse cell linux /etc/jailhouse/rpi4-linux-demo.cell \
                        /boot/vmlinuz* \
                        -d /etc/jailhouse/dts/inmate-rpi4.dtb \
                        -i /usr/libexec/jailhouse/demos/rootfs.cpio \
                        -c "console=ttyS0,115200 ip=192.168.19.2"

What I want to know is : how to set the root to a dir or disk ?

I see some   use   root=/dev/nfs   ip=192.168.1.1::****** :eth0  in this 
page.
[1]https://groups.google.com/g/jailhouse-dev/c/vXD4tzCPDG4/m/zX_hHNxJAgAJ

Can't we set the linux root to a disk partition or a dir ?
Will somebody tell me ?
Thanks very much !

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/254a573f-0b4a-4c6e-a5d5-19d0734cf6ebn%40googlegroups.com.

------=_Part_2497_1759639359.1614256320777
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Community,<div>&nbsp; &nbsp; &nbsp; &nbsp; I have compile the jailhous=
e-images repository, and run the demo.</div><div><br></div><div>&nbsp; the =
command to start linux in a cell is like this:</div><div><div><br></div><di=
v>#jailhouse cell linux /etc/jailhouse/rpi4-linux-demo.cell \</div><div>&nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; /boot/vmlinuz* \</div><div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; -d /etc/jailhouse/dts/inmate-rpi4=
.dtb \</div><div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; -i /usr/libexec/jailhouse/demos/rootfs.cpio \</di=
v><div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; -c "console=3DttyS0,115200 ip=3D192.168.19.2"</div></div><d=
iv><br></div><div>What I want to know is : how to set the root to a dir or =
disk ?</div><div><br></div><div>I see some&nbsp; &nbsp;use&nbsp; &nbsp;root=
=3D/dev/nfs&nbsp; &nbsp;ip=3D192.168.1.1::****** :eth0&nbsp; in this page.<=
/div><div>[1]https://groups.google.com/g/jailhouse-dev/c/vXD4tzCPDG4/m/zX_h=
HNxJAgAJ<br></div><div><br></div><div>Can't we set the linux root to a disk=
 partition or a dir ?</div><div>Will somebody tell me ?</div><div>Thanks ve=
ry much !</div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/254a573f-0b4a-4c6e-a5d5-19d0734cf6ebn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/254a573f-0b4a-4c6e-a5d5-19d0734cf6ebn%40googlegroups.co=
m</a>.<br />

------=_Part_2497_1759639359.1614256320777--

------=_Part_2496_156407620.1614256320777--
