Return-Path: <jailhouse-dev+bncBC653PXTYYERBL6C6OGAMGQE4I2JHOA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qv1-xf40.google.com (mail-qv1-xf40.google.com [IPv6:2607:f8b0:4864:20::f40])
	by mail.lfdr.de (Postfix) with ESMTPS id 1768245A2DE
	for <lists+jailhouse-dev@lfdr.de>; Tue, 23 Nov 2021 13:40:17 +0100 (CET)
Received: by mail-qv1-xf40.google.com with SMTP id r13-20020a0562140c8d00b003bde7a2b8e2sf18959245qvr.6
        for <lists+jailhouse-dev@lfdr.de>; Tue, 23 Nov 2021 04:40:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=qDHApworNC7OOLVWh0SQZ1QHLUf2WtGicopEW8mf6XY=;
        b=HqbbSkF/ZjCyV4dOKuk4YQOKAMfbadm6s/z2z6ZhlP20uKX0VvbXVqaS+3qL9YSnR6
         VnGc7pAa+RvSNlQJ1ukG5QFZckXT2jOVrlK1ecLPdgv1O5h+gS/sBg8Gz4icsRIOcOjy
         NxSIAnD4Xn/ygYuwxUXYlH9am6eYYSnPDO6NWlaNRGr6KQL3OzRa5TnWZBFZ3GQRQIcS
         mbllFjmyrXiCpgSp9MuHck+lgeX0MpapCgfiypi8/scVLOFhRjXHwfNfUdiXau3Hotpu
         uztFPH1TtVUFAhIHZnxIVS+9oF5UtYIAQKP5ZEhZWdkRkq1z1C/KqY9OLTG514Sn7XgK
         nBkg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=qDHApworNC7OOLVWh0SQZ1QHLUf2WtGicopEW8mf6XY=;
        b=d9xDcML4Jvpd8Y0qNKUyyTb+zab45EO0y8kvvxp+KUjwGnDSCgVLf38VSBSOh13l4/
         qS0GQO/9GGjUFdXrfdnfiuaTMqz1EaANf9RCnOb45UPFkz0iL2eFdUuMtPndOxygckmr
         t3hJ4sY2eBclZLpSd4Rl9SRfWhK8x9kxB9nWxpTzR7q7a+vm2Pnjx8C4L/KVFY/QRtEt
         hTRLM8mRwDfkBDxm1+nqo6Q3ur2cMv0zivs7HVXARHe8NOEPtw2ST+Jo0BmtU6hxgk79
         2G1Hr5ysh9c6W32B8T9wVIcQ8q7Z8abUXoHDITwN1qg3Og2lH+JuZfvgnvebv0Fjvphf
         Y9Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=qDHApworNC7OOLVWh0SQZ1QHLUf2WtGicopEW8mf6XY=;
        b=6wswep7XTM7nQQtkwK0ptQnycmmiLcK3Mifk5y6B/6791YXvJ/x0LL/ieAmuGPkOPo
         LlzoKis70KpvEyifEtxp97vDwGWAkAOCs4ZiwW/rMuUbwFFAE39k8Oq+loAPBiaVf5td
         pyn+INraROPvOxevtEsdoVa3+F3CvndClH5+8c7c2dD123s9wXg4Mdt+nAWsmxdwFRZ5
         SLOGqaUk/mjrpLVgbQS/pWuriV4PW70Hli1NXkJ/KPiL4YsNjCLfB7RFdeqzXWHQ0FwA
         7k1ZXHrDUTRktTw/NWXvZKN/ZBIvq2fAnhYzCb89/CtsQyUIZ4Eo3UkQlMb8N7q21l+b
         HETg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530Zbjjh0UVSOHYKJKz4zlzVEcYA0L1/JJ8A1758Cw/veOI/DTCH
	QGiDTFKpaVAikAKr8z/zng4=
X-Google-Smtp-Source: ABdhPJwzargcwcAo3yLxGnJrD2jPIfe+XeCFaan7246hywdFsmid6ZZmPDygsEDLYYyD6K5PauYipA==
X-Received: by 2002:ad4:56a4:: with SMTP id bd4mr6166217qvb.16.1637671216067;
        Tue, 23 Nov 2021 04:40:16 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6214:1a10:: with SMTP id fh16ls3605574qvb.0.gmail; Tue,
 23 Nov 2021 04:40:15 -0800 (PST)
X-Received: by 2002:a05:6214:20e3:: with SMTP id 3mr5626427qvk.47.1637671215402;
        Tue, 23 Nov 2021 04:40:15 -0800 (PST)
Date: Tue, 23 Nov 2021 04:40:14 -0800 (PST)
From: Moustafa Nofal <mustafa13e09940@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <c092ca0e-76b0-4004-a5b1-9e205a5fbee0n@googlegroups.com>
In-Reply-To: <e1ae4c0a-f3c4-5dd2-fd13-cffa2bd9b3a5@siemens.com>
References: <28e452f0-6d96-4db5-9c39-be0c148d12b9n@googlegroups.com>
 <20211025161715.61aa35fe@md1za8fc.ad001.siemens.net>
 <251534da-afb0-4c8d-b44f-28fcba5999acn@googlegroups.com>
 <20211102095459.3a17440d@md1za8fc.ad001.siemens.net>
 <8dce9427-624f-4d62-b803-3ef00552e283n@googlegroups.com>
 <4619cf79-cc46-41f1-914c-9c1f119482dfn@googlegroups.com>
 <72ba65bd-dfaf-40b4-87a8-785657132f60n@googlegroups.com>
 <238dd0b3-af24-4b8a-905e-579fdebe8b0an@googlegroups.com>
 <a18b655e-fd9d-32b9-6e10-acf1fdf91661@siemens.com>
 <9072dd41-feb1-486d-86be-7160e23240edn@googlegroups.com>
 <595778e6-5066-2fc7-ce1d-15bb30b24cde@siemens.com>
 <69d8e666-daf5-4146-b96e-8a6578ec2cf6n@googlegroups.com>
 <597c86a9-bba0-43af-bc14-629d483c0bden@googlegroups.com>
 <e1ae4c0a-f3c4-5dd2-fd13-cffa2bd9b3a5@siemens.com>
Subject: Re: Jailhouse cell linux
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_470_1709249191.1637671214878"
X-Original-Sender: mustafa13e09940@gmail.com
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

------=_Part_470_1709249191.1637671214878
Content-Type: multipart/alternative; 
	boundary="----=_Part_471_294878005.1637671214878"

------=_Part_471_294878005.1637671214878
Content-Type: text/plain; charset="UTF-8"

Hello Jan, 
I edited the device tree over Kernel 5.4 pcie@7d500000
I added, from jailhouse.dts:
            target-path = "/scb/pcie@7d500000";
            linux,pci-domain = <0x00000000>;
The error of invalid domain is gone, two devices were added.
0001:00:00.0 Unassigned class [ff00]: Siemens AG Device 4106
    Subsystem: Siemens AG Device 4106
0001:00:01.0 Unassigned class [ff00]: Siemens AG Device 4106
    Subsystem: Siemens AG Device 4106
However, kernel driver is missing, do you have any ideas?

One last question about 5.10, is it possible to patch 5.10 kernel with 
jailhouse patches? if yes, I checked this website, but I did not get a 
clear idea, which patches are used for 5.10
https://git.kiszka.org/?p=linux.git;a=summary

Best regards, 
Moustafa Noufale

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/c092ca0e-76b0-4004-a5b1-9e205a5fbee0n%40googlegroups.com.

------=_Part_471_294878005.1637671214878
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Jan, <br><div>I edited the device tree over Kernel 5.4 pcie@7d500000<=
/div><div>I added, from jailhouse.dts:<br></div><div>&nbsp;&nbsp; &nbsp;&nb=
sp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; target-path =3D "/scb/pcie@7d500000";<br=
>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; linux,pci-domain =
=3D &lt;0x00000000&gt;;<br>The error of invalid domain is gone, two devices=
 were added.</div><div>0001:00:00.0 Unassigned class [ff00]: Siemens AG Dev=
ice 4106<br>&nbsp;&nbsp; &nbsp;Subsystem: Siemens AG Device 4106<br>0001:00=
:01.0 Unassigned class [ff00]: Siemens AG Device 4106<br>&nbsp;&nbsp; &nbsp=
;Subsystem: Siemens AG Device 4106<br></div><div>However, kernel driver is =
missing, do you have any ideas?</div><div><br></div><div>One last question =
about 5.10, is it possible to patch 5.10 kernel with jailhouse patches? if =
yes, I checked this website, but I did not get a clear idea, which patches =
are used for 5.10<br></div><div>https://git.kiszka.org/?p=3Dlinux.git;a=3Ds=
ummary</div><div><br></div><div>Best regards, <br>Moustafa Noufale<br></div=
>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/c092ca0e-76b0-4004-a5b1-9e205a5fbee0n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/c092ca0e-76b0-4004-a5b1-9e205a5fbee0n%40googlegroups.co=
m</a>.<br />

------=_Part_471_294878005.1637671214878--

------=_Part_470_1709249191.1637671214878--
