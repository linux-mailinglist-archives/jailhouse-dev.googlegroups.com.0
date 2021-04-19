Return-Path: <jailhouse-dev+bncBCCLRRGRQACRBJXU6SBQMGQEOVFFHOY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x83b.google.com (mail-qt1-x83b.google.com [IPv6:2607:f8b0:4864:20::83b])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E01363D26
	for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Apr 2021 10:07:04 +0200 (CEST)
Received: by mail-qt1-x83b.google.com with SMTP id d10-20020a05622a100ab02901b8224bae03sf3136171qte.2
        for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Apr 2021 01:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=skUegyGk9oBvJzwiVxsem8TlkUwn3NJvUdYyz7Ivz7M=;
        b=SHx3fiUKgIg+2AJPA4uvXfLcw7pGF3nhyS0LVC0eybOsHRqs61GgK1u5qce9vUCMsL
         3STAGh9MpRQQhWKTOrcwzsew99sQVPSsl8utBqVqVqx2+ngsycIWtVJFmODQD+o5ulpY
         7h2MYDFoD5nDK/SrFk5hGosb1riFILol12dUx1ZNIPQ01DE6obM4zywijm0ANU16chf8
         8UdI2rhe/tCJw62Z1ccnX7fYxqJQ5sRwAKjQhcFdopt4U4NeoUTHuksnKKg9drFxtJob
         T/oSln14PEjbxEZmtNNGWoxITy6j/EFSIK7/p8c7SZwyFpY3QZksalaSmna9vgfV3Zwt
         Og+A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=skUegyGk9oBvJzwiVxsem8TlkUwn3NJvUdYyz7Ivz7M=;
        b=lv+JYtG1B/UXMUVrhfDw7d6ZD25GtizZXMKp/iQJ0jnej/gMIZQjQUs3wVifoyRVoj
         gNYSB2c5R5yy71VDxBnQ2INknUQNPynf3KPyYW3SCpuewFE8kDmIgS3onhhmZdAHUAAo
         JF7ntvBIDf6Nklhv5dgsJPjw1zJAkEsX/1/rf7h60cTEbntpzKaobDjXJho/Ybo6Cvf2
         8X8S/2Pnj08/BNN2Y8Yr4hdI5W4YdP+ZTodWLDqzZzOUAI0bwGdY2F/Y+U1b7Sf1Y+fi
         Zmg9CsBUWbMNqfh7cHS7cBf1qMjAFj1vNEvbJlK386DeWyt9xiVdFGrw0iFNcKHbiSMr
         FjvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=skUegyGk9oBvJzwiVxsem8TlkUwn3NJvUdYyz7Ivz7M=;
        b=c7JA3tUL8cLfHJmiy3G8zV/z0YQyQPm/7YOR3gBRt0rUDn/7fEUNu62wuaefnniVR/
         ugFVF6DKbODhngzB8bYw/Dc3DF/Q0ewnuTKcJkJ4qMfXK6gJoRLZx5iYRGSqDYd0KRXa
         2KYYc3BKFVEmK+WMo4aHl11GkzvO/TcEawosPOahi3oFgy8jVyvjH1SV9CrDiiJv1KlQ
         H73T7Y8iFYeQQqWDS+d1cXFhWN/Z/ZjrZVahAxstpD+0A0g1oSI+Hh5M++HwrQoU8lHP
         +ITn0Y739reWkKqxiUKoQ34ykax1ENaYtPXQWwtQYe+89mI+F1gRVUu5JEeMU1IvHNeB
         rAZQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533qpdEBV3z2YzsS1k3ciO+KSKvXLlpljGxmTiTB35weGWN2TgqI
	6BwqxH6aoQ/0nYS/e6K0iEw=
X-Google-Smtp-Source: ABdhPJwnqV3GWTTn7kGWqBvBBVxByxP2uesEFw0HBwv6Wbw9NZ/D/En+VwGSscn5eN0bm8tNsa/1EQ==
X-Received: by 2002:a37:bbc4:: with SMTP id l187mr10542361qkf.153.1618819623032;
        Mon, 19 Apr 2021 01:07:03 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac8:5a88:: with SMTP id c8ls6482715qtc.1.gmail; Mon, 19 Apr
 2021 01:07:02 -0700 (PDT)
X-Received: by 2002:aed:2067:: with SMTP id 94mr10897001qta.90.1618819622578;
        Mon, 19 Apr 2021 01:07:02 -0700 (PDT)
Date: Mon, 19 Apr 2021 01:07:02 -0700 (PDT)
From: liandao <liandao@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <7b5cf1d5-aef0-41bb-bedc-4350046e53c1n@googlegroups.com>
Subject: high latency in inmate linux on imx8mm evk
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_8006_847268736.1618819622048"
X-Original-Sender: liandao@gmail.com
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

------=_Part_8006_847268736.1618819622048
Content-Type: multipart/alternative; 
	boundary="----=_Part_8007_1255747490.1618819622048"

------=_Part_8007_1255747490.1618819622048
Content-Type: text/plain; charset="UTF-8"

i try jailhouse on NXP IMX8MM LPDDR4 EVK, and i test latency on root and 
inmate.
most instructions are according i.MX_Linux_Users_Guide.pdf 
(ver:L5.4.70_2.3.0) from NXP.
i build 3 type linux kernels:
1)normal kernel
2)kernel with PREEMPT-RT
3)kernel with xenomai
we get the PREEMPT-RT patch and xenomai'Ipipe patch form an blog on i.MX 
Forums/i.MX Processors Knowledge Base.
these linux config has turn off: CONFIG_CPU_FREQ/CONFIG_CPU_IDLE.

a)when the root is an normal kernel or kernel with PREEMPT-RT, inmate is 
gic-demo.bin, 
do "stress-ng --cpu 4 --io 8 --vm 8 --vm-bytes 8M --fork 4 --udp 4 
--timeout 1h" in root linux
and within an hourse gic-demo can hit max 14us jitter.

a)when the root is kernel with PREEMPT-RT, inmate is the kernel with 
PREEMPT-RT, 
run "cyclictest -l100000  -p99" in inmate linux,then max latency is about 
80us

a)when the root is kernel with PREEMPT-RT, inmate is the kernel with 
xenomai, 
run "/usr/xenomai/bin/latency -t 0 -h -g ./202100419_01.log" in inmate 
linux,
then max latency is about 50us-100us,
if root linux do nothing, the latency in inmate is better,
if do "stress-ng --cpu 4 --io 8 --vm 8 --vm-bytes 8M --fork 4 --udp 4 
--timeout 100s" in root linux,
the latency in inmate can hit 89us.

my question is: while the latency in inmate linux is still so high?what 
impact the inmate linux? how to get better latency in inmate?
run RTOS(not linux) in inmate?

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/7b5cf1d5-aef0-41bb-bedc-4350046e53c1n%40googlegroups.com.

------=_Part_8007_1255747490.1618819622048
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>i try jailhouse on NXP IMX8MM LPDDR4 EVK, and i test latency on root a=
nd inmate.</div><div>most instructions are according i.MX_Linux_Users_Guide=
.pdf (ver:L5.4.70_2.3.0) from NXP.</div><div>i build 3 type linux kernels:<=
/div><div>1)normal kernel</div><div>2)kernel with PREEMPT-RT</div><div>3)ke=
rnel with xenomai</div><div>we get the PREEMPT-RT patch and xenomai'Ipipe p=
atch form an blog on i.MX Forums/i.MX Processors Knowledge Base.</div><div>=
these linux config has turn off: CONFIG_CPU_FREQ/CONFIG_CPU_IDLE.</div><div=
><br></div><div>a)when the root is an normal kernel or kernel with PREEMPT-=
RT, inmate is gic-demo.bin,&nbsp;</div><div>do "stress-ng --cpu 4 --io 8 --=
vm 8 --vm-bytes 8M --fork 4 --udp 4 --timeout 1h" in root linux</div><div>a=
nd within an hourse gic-demo can hit max 14us jitter.</div><div><br></div><=
div>a)when the root is kernel with PREEMPT-RT, inmate is the kernel with PR=
EEMPT-RT,&nbsp;</div><div>run "cyclictest -l100000&nbsp; -p99" in inmate li=
nux,then max latency is about 80us</div><div><br></div><div>a)when the root=
 is kernel with PREEMPT-RT, inmate is the kernel with xenomai,&nbsp;</div><=
div>run "/usr/xenomai/bin/latency -t 0 -h -g ./202100419_01.log" in inmate =
linux,</div><div>then max latency is about 50us-100us,</div><div>if root li=
nux do nothing, the latency in inmate is better,</div><div>if do "stress-ng=
 --cpu 4 --io 8 --vm 8 --vm-bytes 8M --fork 4 --udp 4 --timeout 100s" in ro=
ot linux,</div><div>the latency in inmate can hit 89us.</div><div><br></div=
><div>my question is: while the latency in inmate linux is still so high?wh=
at impact the inmate linux? how to get better latency in inmate?</div><div>=
run RTOS(not linux) in inmate?</div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/7b5cf1d5-aef0-41bb-bedc-4350046e53c1n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/7b5cf1d5-aef0-41bb-bedc-4350046e53c1n%40googlegroups.co=
m</a>.<br />

------=_Part_8007_1255747490.1618819622048--

------=_Part_8006_847268736.1618819622048--
