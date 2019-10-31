Return-Path: <jailhouse-dev+bncBCDJXM4674ERBKM35XWQKGQECTLGUZQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x23c.google.com (mail-oi1-x23c.google.com [IPv6:2607:f8b0:4864:20::23c])
	by mail.lfdr.de (Postfix) with ESMTPS id BF829EB8BB
	for <lists+jailhouse-dev@lfdr.de>; Thu, 31 Oct 2019 22:10:02 +0100 (CET)
Received: by mail-oi1-x23c.google.com with SMTP id x15sf4452044oif.19
        for <lists+jailhouse-dev@lfdr.de>; Thu, 31 Oct 2019 14:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=5RdijcujlyigVpISU7UXWo9hPj5muoQ2gLqr18ziehg=;
        b=qZquxS6y3BbXIGtSBNmJDZT30Da2PgfzON1eNpsNrn+WsbAdVUYjB3fLGq6siuDF8V
         ZJL6LEHPVXeQxVsW8eMi8nLmLGkw5mJFmMB4CLB7CBgmg36w+i3G/HstO3s0SDne5VBK
         hBCwSd42vCH5VK4QMwFFHntA5dvNR18kb9UKsjIDa7f00ERXzc0Sc2ZJ/pSGrqrPjPdj
         t10uhpVdnFRoHiuWgpKgVTscApbhqhonQzgkMebLm8NtUKquaFuCOAIQSqDaE45ZKEf7
         WYQ/CJN7MdRYqrrZ30Wp8UjOh+RSXV/Jyfu2WgrfHtdLX9Rfztv2pKK9TjMv6sqzDyF5
         z+Pw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=5RdijcujlyigVpISU7UXWo9hPj5muoQ2gLqr18ziehg=;
        b=A34NiGIfDQMcnxJBwYgxHxFqaSiLSOo3GaaiJCj5mDAODzcE1p0Fo+H8Z8P+vnvitd
         mBkK76+01neB2o844FMAk8WxKPMWK6AIrACkV/dbr+wDfQjV7qAXrrC09BRPFJkpDBOE
         QVF34+Y/76iDw+rFMB76RkpifF2L16rN6BkWpRdgnunompX6FX6UfZ4WpqwwJaJLQ6en
         kT56cm3aDH37Uuri9N1nUcHIfKbaIUjiYPaNnCVlK97DS/y/GddeytzCdki2k+ROTWfx
         SsdAr5LibxF7ZMzyDjKSyhNb3OKLb/PrG8Qxc6d3RtbYNLymQKJtMv/7FDEBvi1U1PTB
         H38w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=5RdijcujlyigVpISU7UXWo9hPj5muoQ2gLqr18ziehg=;
        b=Ybo0qyO7+PUSODXFsElkppovyrfYC89Z2QFb8wjd6oCevRcv3AvGW31EeNyNMjf8v9
         EYulwNe27ZTu5Sz0pMtphYV1SqjerWUHHursVPrerpoY1Y5yAW04VNQdgj7e4VYM5mi8
         +97N4hEXv29d3PGmgzysSrn2XXzL5DlolAkwzqQB/CV1v2xxb/XmPV48A27OPLr1ENb/
         bhEzdB82Ro2Vdm4n58zP0rF+flIOjHhjyGmx3PNk93TeYQTcCV6g/LLGT9MZyxLQItvb
         N70CoxWM4Tfspm6a7m/tnk3qVauM421BARD3zpDZVaZN+QM7tC0ZKrel3M/MHBeeclNF
         ZClw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUeHfXhyI6DIbzGZy7qd9svbiM7PMP2flWPdu4jydfWVCOreLjf
	BeCbGFQYCy3fLmQbthFdNMU=
X-Google-Smtp-Source: APXvYqwxBk5VJ5h75jKjP3FTZHFYPNt9wMeUEId77lMKekOg8TbUVAHHCfAByKrlVN2O06GzKXO4Mw==
X-Received: by 2002:a9d:5181:: with SMTP id y1mr5853727otg.62.1572556201636;
        Thu, 31 Oct 2019 14:10:01 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a54:4407:: with SMTP id k7ls876624oiw.7.gmail; Thu, 31 Oct
 2019 14:10:01 -0700 (PDT)
X-Received: by 2002:aca:31cc:: with SMTP id x195mr5695570oix.178.1572556200711;
        Thu, 31 Oct 2019 14:10:00 -0700 (PDT)
Date: Thu, 31 Oct 2019 14:09:59 -0700 (PDT)
From: michael.g.hinton@gmail.com
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <01105881-d1d1-4931-b950-0b6028cd5ac5@googlegroups.com>
Subject: TSC Frequency
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_69_1473608695.1572556199814"
X-Original-Sender: Michael.G.Hinton@gmail.com
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

------=_Part_69_1473608695.1572556199814
Content-Type: multipart/alternative; 
	boundary="----=_Part_70_414096940.1572556199814"

------=_Part_70_414096940.1572556199814
Content-Type: text/plain; charset="UTF-8"

Hello,

I notice that on my machine (Coffee Lake architecture, Intel 8th 
Generation), apparently Linux detects a TSC frequency of 3,696,003,000 Hz. 
However, the Intel SDM Vol. 4 Table 2-20, under bits 8-15 of the 
PLATFORM_INFO_MSR (0xCE), says that the invariant TSC runs at the Maximum 
Non-Turbo Ratio, which is some multiple of 100 MHz. So on my machine, I get 
37, which means 3,700,000,00 Hz.

My question is whether this minor discrepancy is something to worry about, 
and which one should I use to get the most accurate frequency measurements 
when calculating the current CPU frequency using the APERF/MPERF MSR ratio.

Thanks,
-Michael

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/01105881-d1d1-4931-b950-0b6028cd5ac5%40googlegroups.com.

------=_Part_70_414096940.1572556199814
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<div><br></div><div>I notice that on my machine (Cof=
fee Lake architecture, Intel 8th Generation), apparently Linux detects a TS=
C frequency of=C2=A03,696,003,000 Hz. However, the Intel SDM Vol. 4 Table 2=
-20, under bits 8-15 of the PLATFORM_INFO_MSR (0xCE), says that the invaria=
nt TSC runs at the=C2=A0Maximum Non-Turbo Ratio, which is some multiple of =
100 MHz. So on my machine, I get 37, which means 3,700,000,00 Hz.</div><div=
><br></div><div>My question is whether this minor discrepancy is something =
to worry about, and which one should I use to get the most accurate frequen=
cy measurements when calculating the current CPU frequency using the APERF/=
MPERF MSR ratio.</div><div><br></div><div>Thanks,</div><div>-Michael</div><=
/div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/01105881-d1d1-4931-b950-0b6028cd5ac5%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/01105881-d1d1-4931-b950-0b6028cd5ac5%40googlegroups.com<=
/a>.<br />

------=_Part_70_414096940.1572556199814--

------=_Part_69_1473608695.1572556199814--
