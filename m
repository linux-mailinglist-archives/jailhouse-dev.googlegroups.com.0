Return-Path: <jailhouse-dev+bncBC4IPGFA6UFRBKEDUH3QKGQELLDGAZI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pg1-x53d.google.com (mail-pg1-x53d.google.com [IPv6:2607:f8b0:4864:20::53d])
	by mail.lfdr.de (Postfix) with ESMTPS id 07FB61FA726
	for <lists+jailhouse-dev@lfdr.de>; Tue, 16 Jun 2020 05:51:06 +0200 (CEST)
Received: by mail-pg1-x53d.google.com with SMTP id x18sf8070707pgk.23
        for <lists+jailhouse-dev@lfdr.de>; Mon, 15 Jun 2020 20:51:05 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1592279464; cv=pass;
        d=google.com; s=arc-20160816;
        b=zroVpOaRndguvORoceS/xrav8dflFBKVGiEG6ayBQZEA5W2ztzLKnr31ov4E8yamKq
         9QtULtr7FJnUaPKaQVQiOV6hhHqUkBbQEdFxqt0tXFDBKCsHqTdByEURJChJEeB4SZRM
         4lj90MAxtPpNvPZWIY/tfnb7miQsxG7jRXlgO09DA73Wszso7ZWoXggEjZqQENYMBMWV
         QzHKzuXI+FyW6WisAHt6tZTSj1kQhtkWlCGOcj0K6AsnAu7kRY3y38jq128HmaZ2XOc6
         IuXDMKvzIDGu+Dpt7XYGBsJDy1+kEDV9Hv89cVyWlUFDi1HtS5LVU1QW0+ZEVp1TYtKN
         vYZA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:feedback-id:message-id:date
         :content-transfer-encoding:mime-version:subject:to:from:sender
         :dkim-signature;
        bh=q5xHysjhmm6zYu/vMLSeen39aB+ocurJjXJczjObgYU=;
        b=yqhnBKGaAj04/YKavUfH6eNAib1tzi+nlz9xvVgHruwbZgQjOrVUDOpKXxuc9qjtNB
         rSjHRaF8EhWrD+RxkJRa5cmmQufgmy7RYkWFZw623lzT2LagHc/K9wzvBnyKfcJI0WVj
         Wz6TYiPnVfqxvUyJVM2yZlZKLdmlwn7WqaYV4+MPaom9hAzcdsAl6cc4982eLAF1cTjW
         nM4llhkuefSKlDuCqVtNYjFYOpGSO9NLjJb3q5qKAsVIKutQzl57MA/Uaz9WkP2kqFcu
         OMkMDa/HAXXDSZoYywEI6NN+S8thd9WABmv4AtIdupwiJNoWHTMFnBn6rdpZ6AYAqDbS
         WvCA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@qq.com header.s=s201512 header.b=fLzKAf13;
       spf=pass (google.com: domain of 497738387@qq.com designates 54.207.22.56 as permitted sender) smtp.mailfrom=497738387@qq.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=qq.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:mime-version:content-transfer-encoding:date
         :message-id:feedback-id:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=q5xHysjhmm6zYu/vMLSeen39aB+ocurJjXJczjObgYU=;
        b=rr+UTqFs0FQz5CwAYvVnZ0LkG4Eu8XwxOqIUR8I7EuJF36yHs6JsmjWuiecR+lE4mt
         bDfZfF10YH1SVWaT/H8jgeIVXOGZm6tSlxXzQO8IcaFKQUiOcnys8trhtBmVz2TQcLYI
         3MfLGUCCQ4B7XS8T0DNLzU9YGf43PM9/pGofx5EWQQEz66wMfnt1Zek+vpOuDI9K2zVQ
         2cMpN3q8JfqV80+buFW/0o49jnNimLwSCbo+AQkpwax1gCfWXA1a17RPZFuhZay5rvM8
         rm/RleScAZbkTPMM4qRhRXxu07cSTN+Rnu1wqm+NxvsT7XkuJVX7D1dfV2HwLJuEmwQT
         OUiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:mime-version
         :content-transfer-encoding:date:message-id:feedback-id
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=q5xHysjhmm6zYu/vMLSeen39aB+ocurJjXJczjObgYU=;
        b=qnBlmF3m9UGSHpR9/MHvz9avg1wVw46FxSJHIzZHhPZzWE2Elj8BHW/vn2Jg0XtfFq
         8yXq6UPChKH7ZNdiNrPAQqv8wMIfh1cXTi/FSaGSCp4H+HrYy5wJ98GstPvMfD80eiZj
         Xc9C1KhsAqd1MgIHW1woB1zxLawnUjQUiypyqFsjJfsl12h4UfNIhWpN11NHfUn8pqPc
         NaMj+lmgqCpvZnCSZsMHbaLGXJwTt4TMIe/IMfgkqZzUmNcttCy1SFDoEqZ/pUD09FhS
         j6SQhvVQX691Ca34nb3BpqP9Y/tl4uFr2iitlqAVvdzT64XV2FNYsm/YOljmOEsKszvn
         Z/rg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530dDW9L3qoBcCPpVO6PT+lrxWF+9UVcPOdLB4gFD6sYYTXwP40b
	PAmz0cRbVgBfCoAsgfs1mtY=
X-Google-Smtp-Source: ABdhPJxpIKH1oJrTi6xMTV3bcn1BQZCdWt86rcNHu9UXiFyG6h011+jxRDxYeE2fJJQZa3GESlpDOw==
X-Received: by 2002:aa7:9f10:: with SMTP id g16mr346397pfr.47.1592279464683;
        Mon, 15 Jun 2020 20:51:04 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a63:3c1:: with SMTP id 184ls3979858pgd.11.gmail; Mon, 15 Jun
 2020 20:51:04 -0700 (PDT)
X-Received: by 2002:a62:5ec2:: with SMTP id s185mr367812pfb.0.1592279464048;
        Mon, 15 Jun 2020 20:51:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592279464; cv=none;
        d=google.com; s=arc-20160816;
        b=D8M5HqIIiCa/JYUfa46khudQUDDA4Ny2sLR5l2j7oKOxqoE3FjX1tlhmPTU+fk2EU2
         No4PbRILS/t2VA7tWZ9hqx8gU8C6Ti3gYnKDABUXOUSgvI1WGtSsT3Avxim3r+2qoUN2
         90zecVekQ/YVEgMNpruhdl/z46i5dAKL2WR7VXv3e9110/N6v6cGoQ/CI+jhgN28iCci
         h+LKTCkgFXTzHFlz4oWkEyz8eGnhLDUjQqj0UvzbCuiGCoRSrwRITTgyD2ibC3G/rKIZ
         S/WSt/VV+sZiY2IHmOOnXBygxkOSNUy1i+4N+bpKgHSxjjimD1CmwMqCQVobKc/kbttD
         3HbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=feedback-id:message-id:date:content-transfer-encoding:mime-version
         :subject:to:from:dkim-signature;
        bh=Npw/gLKuheermUN1MJFXOBeq7GfgPMCa72ycsJubYtY=;
        b=mvPgYGUQCx0+Bzu9qxTD6pficGGz1w2DWN07FljtH2MP3IhUmYtB2yBOhNsMiNvX48
         tiBA3dH0IRWmO60XL/R20zuzRBGpXfm+WY3+iimbZR+JY6FRyaeG+gim8IZl8RrzZ731
         xE1yKaV3Kftu2vfqADABvdLP8IFEDaj8hn/TshE3w47JZuDUNtK46G1arMMgNdduRyPH
         17Floe/hoL+UXgdZc6GjcjWGtxMcyCgNbaqUtf1KS0RLQB0zxBYHl97+WRIE1Hxq8K/8
         DwSu6Xei9gKLgIm7+/CrvIXgyztub265se3N09RVSZk/DPDBWe8l2q2yr3UQWUFN8PRz
         UTaw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@qq.com header.s=s201512 header.b=fLzKAf13;
       spf=pass (google.com: domain of 497738387@qq.com designates 54.207.22.56 as permitted sender) smtp.mailfrom=497738387@qq.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=qq.com
Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com. [54.207.22.56])
        by gmr-mx.google.com with ESMTPS id x70si1032338pfc.6.2020.06.15.20.51.02
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 15 Jun 2020 20:51:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of 497738387@qq.com designates 54.207.22.56 as permitted sender) client-ip=54.207.22.56;
X-QQ-FEAT: ZHIynFL7/hQWaAoC9qtPzMo43H6jmmYT4NX/kxLU6X8yf3+Cj/idfTPZDMIMV
	z8ho0I+ma7lAbO/aGy+lOaVnXUecyAEtSY3KlJXm/xetIsdQB4g7YwUEWPc/XlamCP2QR0o
	tZAqeEzkqp528RAf/SXKCJWvxIN9+Y/TDNmnyNIrZD1VkJ4zZAqKdtxp7TKGtKduakPqge4
	2vGxzDAJ0X28IFBYPsGWPYTJ4QQDk0+AHBlCiQX2gJfZAP2Rtr3jWPmp5qSmV/KTSxse1Ad
	O5rbe79cgleRcEFZYmZOE24ww=
X-QQ-SSF: 00010000000000F000000000000000T
X-QQ-XMAILINFO: MHMWHkHpkjqPMwmjh3a7BDjuK3h43UdiWnWVTa79PBX7NM9SMChfRzaVgC8ycD
	 qfAoXnZx7EDsK3gNFyGZARQSS2X3rGLttfPDvhtePUeAypdDK2dC7GV+9RCRYCci0YN7gpBzjWpuZ
	 6DPVBARzVi9dMV8D/Y7j+J+9CYvw8RYLzpNBUTSk13U6HEW/Lv6gE0RDWKmEthjnYgK8+BB3Le07S
	 F2C5We6+jC/8YObgJTktjrPPKAv4zvQbom816umisxvxI4S7/X6W35+bqi9yxn40CQKNrsoVsR8DU
	 nDb7p+IRbz5HohOzkXAloEkx7WPLN2vgYsy47T8gOMJ9uNTNEnK496YK6J3H4ZCqHUiGKkmLvnF4q
	 5RzStkJcE+21QeJSiCuQt65MdQlWPZCU5xdBpAJuuDLIYyhemunALWxplZRZzaN0duk6HgbzcBH5c
	 4sRKDQLYAxfCJKoiB9MS9vSXeV3/xDx5838t3zJN9ZL2g9s2+rW+HHpIhk+WAQHM2pzOeC/Ds/+HH
	 9dEIG2Awc30GHRidCzBztG3/JQ2TbyDArtylzXiLJx7FK9aq5ssY4nKmk53HRpxHi7dlPiH/lDaNP
	 7mOpzF5QdF1xxJ9XBoDF/UD7qltNAfL4iHgFhVzzWGzDsU4xZTquaSQXuSuuUmmiQLqX2f2+cxN1m
	 FrAeE3
X-HAS-ATTACH: no
X-QQ-BUSINESS-ORIGIN: 2
X-Originating-IP: 178.128.201.135
X-QQ-STYLE: 
X-QQ-mid: webmail721t1592279457t6727663
From: "=?ISO-8859-1?B?ZGQ=?=" <497738387@qq.com>
To: "=?ISO-8859-1?B?amFpbGhvdXNlLWRldg==?=" <jailhouse-dev@googlegroups.com>
Subject: problem about enable jailhouse on rpi4
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_5EE841A1_117685A8_2A6C824F"
Content-Transfer-Encoding: 8Bit
Date: Tue, 16 Jun 2020 11:50:57 +0800
X-Priority: 3
Message-ID: <tencent_62A2790D0DC156ADD77061CB612F88C4FC09@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
X-QQ-SENDSIZE: 520
Received: from qq.com (unknown [127.0.0.1])
	by smtp.qq.com (ESMTP) with SMTP
	id ; Tue, 16 Jun 2020 11:50:57 +0800 (CST)
Feedback-ID: webmail:qq.com:bgforeign:bgforeign11
X-QQ-Bgrelay: 1
X-Original-Sender: 497738387@qq.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@qq.com header.s=s201512 header.b=fLzKAf13;       spf=pass
 (google.com: domain of 497738387@qq.com designates 54.207.22.56 as permitted
 sender) smtp.mailfrom=497738387@qq.com;       dmarc=pass (p=NONE sp=NONE
 dis=NONE) header.from=qq.com
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

This is a multi-part message in MIME format.

------=_NextPart_5EE841A1_117685A8_2A6C824F
Content-Type: text/plain; charset="UTF-8"

Hello.
I have met a problem when i enable jailhouse on rpi4.And i want to ask for advice.

when i enable jailhouse using the rpi4 config file from jailhouse repo,
it begin to initializing processors,but it crashes and the error message is:


Initializing Jailhouse hypervisor v0.12 (59-g4ce7658d) on CPU 1
Code location: 0x0000ffffc0200800
Page pool usage after early setup: mem 39/994, remap 0/131072
Initializing processors:
&nbsp;CPU 1... 
FATAL: Unhandled HYP exception: synchronous abort from EL2
&nbsp;pc: 0000ffffc0203860&nbsp;&nbsp; lr: 0000ffffc020384c spsr: 800003c9&nbsp;&nbsp;&nbsp;&nbsp; EL2
&nbsp;sp: 0000ffffc0222e40&nbsp; esr: 00 1 0000000
&nbsp;x0: 0000000084000000&nbsp;&nbsp; x1: 0000000000000008&nbsp;&nbsp; x2: 0000000080003580
&nbsp;x3: 0000ffffc020e170&nbsp;&nbsp; x4: 0000000000000014&nbsp;&nbsp; x5: 0000000000000001
&nbsp;x6: 0000000000000029&nbsp;&nbsp; x7: 0000ffffc0219d30&nbsp;&nbsp; x8: 000000000000002a
&nbsp;x9: 0000000000000000&nbsp; x10: 0000000000000000&nbsp; x11: 0000000000000001
x12: 0000000000000015&nbsp; x13: 0000000000000001&nbsp; x14: 0000ffffc0219000
x15: 0000ffffc0015040&nbsp; x16: 0000ffffc020d230&nbsp; x17: ffffabc8c78e90c8
x18: 0000000000000001&nbsp; x19: 0000ffffc0222000&nbsp; x20: 0000ffffc0219000
x21: 0000ffffc0200000&nbsp; x22: 0000ffffc0219000&nbsp; x23: 0000000000000001
x24: 0000000000000001&nbsp; x25: 0000ffffc0222000&nbsp; x26: 0000ffffc0223000
x27: 0000ffffc020f000&nbsp; x28: 0000ffffc0218000&nbsp; x29: 0000ffffc0222e40

Hypervisor stack before exception Stopping CPU 1 (Cell: "Raspberry-Pi4")


could you give me some information or advice about it.
Thank you.

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/tencent_62A2790D0DC156ADD77061CB612F88C4FC09%40qq.com.

------=_NextPart_5EE841A1_117685A8_2A6C824F
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DGB18030">=
<div>Hello.</div><div>I have met a problem when i enable jailhouse on rpi4.=
And i want to ask for advice.<br></div><div>when i enable jailhouse using t=
he rpi4 config file from jailhouse repo,</div><div>it begin to initializing=
 processors,but it crashes and the error message is:</div><div><br></div><d=
iv>Initializing Jailhouse hypervisor v0.12 (59-g4ce7658d) on CPU 1</div>Cod=
e location: 0x0000ffffc0200800<br>Page pool usage after early setup: mem 39=
/994, remap 0/131072<br>Initializing processors:<br>&nbsp;CPU 1... <br>FATA=
L: Unhandled HYP exception: synchronous abort from EL2<br>&nbsp;pc: 0000fff=
fc0203860&nbsp;&nbsp; lr: 0000ffffc020384c spsr: 800003c9&nbsp;&nbsp;&nbsp;=
&nbsp; EL2<br>&nbsp;sp: 0000ffffc0222e40&nbsp; esr: 00 1 0000000<br>&nbsp;x=
0: 0000000084000000&nbsp;&nbsp; x1: 0000000000000008&nbsp;&nbsp; x2: 000000=
0080003580<br>&nbsp;x3: 0000ffffc020e170&nbsp;&nbsp; x4: 0000000000000014&n=
bsp;&nbsp; x5: 0000000000000001<br>&nbsp;x6: 0000000000000029&nbsp;&nbsp; x=
7: 0000ffffc0219d30&nbsp;&nbsp; x8: 000000000000002a<br>&nbsp;x9: 000000000=
0000000&nbsp; x10: 0000000000000000&nbsp; x11: 0000000000000001<br>x12: 000=
0000000000015&nbsp; x13: 0000000000000001&nbsp; x14: 0000ffffc0219000<br>x1=
5: 0000ffffc0015040&nbsp; x16: 0000ffffc020d230&nbsp; x17: ffffabc8c78e90c8=
<br>x18: 0000000000000001&nbsp; x19: 0000ffffc0222000&nbsp; x20: 0000ffffc0=
219000<br>x21: 0000ffffc0200000&nbsp; x22: 0000ffffc0219000&nbsp; x23: 0000=
000000000001<br>x24: 0000000000000001&nbsp; x25: 0000ffffc0222000&nbsp; x26=
: 0000ffffc0223000<br>x27: 0000ffffc020f000&nbsp; x28: 0000ffffc0218000&nbs=
p; x29: 0000ffffc0222e40<br><br><div>Hypervisor stack before exception Stop=
ping CPU 1 (Cell: "Raspberry-Pi4")</div><div><br></div><div>could you give =
me some information or advice about it.</div><div>Thank you.<br></div><br>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/tencent_62A2790D0DC156ADD77061CB612F88C4FC09%40qq.=
com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/msg=
id/jailhouse-dev/tencent_62A2790D0DC156ADD77061CB612F88C4FC09%40qq.com</a>.=
<br />

------=_NextPart_5EE841A1_117685A8_2A6C824F--



