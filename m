Return-Path: <jailhouse-dev+bncBC65DHEH7QOBBP64XCAQMGQES62Y5ZQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x738.google.com (mail-qk1-x738.google.com [IPv6:2607:f8b0:4864:20::738])
	by mail.lfdr.de (Postfix) with ESMTPS id 4043931E7C1
	for <lists+jailhouse-dev@lfdr.de>; Thu, 18 Feb 2021 10:07:14 +0100 (CET)
Received: by mail-qk1-x738.google.com with SMTP id h185sf868613qkd.4
        for <lists+jailhouse-dev@lfdr.de>; Thu, 18 Feb 2021 01:07:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Hv/OZd2NJegl5xYd603I3KoDxoCf6Pl/Rdahb1SqIiE=;
        b=UklGBN/Axb7maS+tMhb3hrOT+XaGz1YX8EesMTGqcR4V+29QsYmcg1g0LzDw2SXyqA
         rloaeqBYeyzwsC4bbc3oNV+B8UUOVct/a6MceJsM//k0Mayas6SfV0qQSm4zRLq+r8xX
         fnpx278XCO/HfobuxR2OekYyUY46f8I+0XUGcc1kC5huP5LseJaSpVLK+DXGQm2nEXSr
         n1c7q1jaGF4dgMXRxPbmYwW4oojkPskHlN+gZ+2/NGOk7PMU0+edq524J31P1mNt9akp
         8r1HelYRS7E0O+gdfATOmOGVARmxo7dduLV9fiY68L01A6oF8yfGMJxMJeMcYFtTcnLe
         jm4w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=unikie-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Hv/OZd2NJegl5xYd603I3KoDxoCf6Pl/Rdahb1SqIiE=;
        b=klRK15m+tNV6hZyKVCYoqWWURG1XjMCkyBG781/GSLVY9QnVu6v3XPvqbZ3Ks5RCvH
         UaMkuNFqCW2+exl4VjFEq2OdTzEi5PVDwHLGX+Q7uqrE7LkSSQ6muL0SS1lPr/TZdA91
         JfUgcZY8hHRlFCTzdNgV2KuKxh5bwscYo+V1iEg/aLu/NEBSQTFbEmwJQE4Zn+999Dnh
         nywN2ujFTXMYbJ0kAtIDXOGk1gw7CI6GNIWV0nBxvWotOZco9ZzNYys1ErEl0Du51Oit
         hmjAbUIUtDngdaG9xjNYV5co1naXdlly6ge0Z2tf30LQNeyc3tBRWUB1eBPvVd2MPZV1
         z3mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Hv/OZd2NJegl5xYd603I3KoDxoCf6Pl/Rdahb1SqIiE=;
        b=lQd8U6VkVER1yF81+Fd9hwdMeJN19jLxGbgP1d9bAripFEeoQK9hfU2ljUBP0/nPbr
         wGV9r7NfXpk6MtxcwAx+EBbKAUTvWwi/ZwtP8GsxOdqUgL6tmqCEY6K/FBEb748n1t5H
         wadA9p8cxgnfD94p9di7dFOtRocWmROemZEOD7gup/4R8KB4GkFfFQgqJX2GxF82e+91
         Y8eLvz5INlKqonDCBzsZzBpcC5ZgfOuUljWdmAT5atkeYQviMWggyJosVmRxzLvW53n2
         WaLPU1vJFAJbf5Zi8GnZvIxGDu6AJgrvJYMGGpNl9KV/CpqrJt06156cmgY0Lg1fxvxs
         jMIQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533SKB7ZL3ltm6ugX2f68Fa/8GTMY8NJGhrno8LvdHmfa66Q5F53
	PJbF1yLzL5rzAi70EPr/zkE=
X-Google-Smtp-Source: ABdhPJydhTOQ0qb+y3Ff/nMcwZk7/ujtVI4ivr89dP62zavEKtYbA7LlQL5kOzW33/qD6Q27yfVtdw==
X-Received: by 2002:aed:30a3:: with SMTP id 32mr678925qtf.130.1613639231971;
        Thu, 18 Feb 2021 01:07:11 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a37:684e:: with SMTP id d75ls2425257qkc.9.gmail; Thu, 18 Feb
 2021 01:07:11 -0800 (PST)
X-Received: by 2002:a05:620a:204b:: with SMTP id d11mr3245940qka.429.1613639231407;
        Thu, 18 Feb 2021 01:07:11 -0800 (PST)
Date: Thu, 18 Feb 2021 01:07:10 -0800 (PST)
From: Jari Ronkainen <jari.ronkainen@unikie.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <6944c92b-5a96-48fd-a74d-0d8fb0c0d3ean@googlegroups.com>
Subject: Jailhouse hanging
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_5116_578149884.1613639230873"
X-Original-Sender: jari.ronkainen@unikie.com
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

------=_Part_5116_578149884.1613639230873
Content-Type: multipart/alternative; 
	boundary="----=_Part_5117_520621703.1613639230873"

------=_Part_5117_520621703.1613639230873
Content-Type: text/plain; charset="UTF-8"

I have tried to get jailhouse running on  UP xtreme board with an LTE 
module attached.
However, running into some problems, and this one is one I couldn't
solve myself:  The entire system hangs quite fast after getting this
message:

    VT-d fault event reported by IOMMU 1:
      Source Identifier (bus:dev.func): 01:00.0
       Fault Reason: 0x22 Fault Info: 2d000000000 Type 0

The 01:00.0 is the PCI address for the LTE module.

Cross-referencing with Linux kernel, I figured that 0x22 is
"Present bit in context entry is clear"

Don't know how to figure out what to do with "fault info" or "type"
here either.

Root cell configuration can be found in

 https://pastebin.com/armiRjH9

Setting iommu = 0 for the LTE modem prevents system from hanging
instantly, but the failure message is still there.  Issuing "jailhouse 
disable"
still hangs the system reliably with no extra messages.


relevant lspci:
   01:00.0 Network controller: Qualcomm Atheros QCA6174 802.11ac Wireless 
Network Adapter


Thanks all for the previous help, and thanks in advance for helping.

Also, I got this from jailhouse console -f, I don't get anything from the
UART, does that mean misconfiguration there in this case?

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/6944c92b-5a96-48fd-a74d-0d8fb0c0d3ean%40googlegroups.com.

------=_Part_5117_520621703.1613639230873
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>I have tried to get jailhouse running on&nbsp; UP xtreme board with an=
 LTE module attached.<br></div><div>However, running into some problems, an=
d this one is one I couldn't</div><div>solve myself:&nbsp; The entire syste=
m hangs quite fast after getting this</div><div>message:</div><div><br></di=
v><div>&nbsp; &nbsp; VT-d fault event reported by IOMMU 1:<br>&nbsp; &nbsp;=
 &nbsp; Source Identifier (bus:dev.func): 01:00.0<br>&nbsp; &nbsp; &nbsp; &=
nbsp;Fault Reason: 0x22 Fault Info: 2d000000000 Type 0<br></div><div><br></=
div><div>The 01:00.0 is the PCI address for the LTE module.</div><div><br><=
/div><div>Cross-referencing with Linux kernel, I figured that 0x22 is</div>=
<div>"Present bit in context entry is clear"</div><div><br></div><div>Don't=
 know how to figure out what to do with "fault info" or "type"<br></div><di=
v>here either.</div><div><br></div><div>Root cell configuration can be foun=
d in</div><div><br></div><div>&nbsp;https://pastebin.com/armiRjH9<br></div>=
<div><br></div><div>Setting iommu =3D 0 for the LTE modem prevents system f=
rom hanging</div><div>instantly, but the failure message is still there.&nb=
sp; Issuing "jailhouse disable"</div><div>still hangs the system reliably w=
ith no extra messages.</div><div><br></div><div><br></div><div>relevant lsp=
ci:</div><div>&nbsp; &nbsp;01:00.0 Network controller: Qualcomm Atheros QCA=
6174 802.11ac Wireless Network Adapter</div><div><br></div><div><br></div><=
div>Thanks all for the previous help, and thanks in advance for helping.</d=
iv><div><br></div><div>Also, I got this from jailhouse console -f, I don't =
get anything from the</div><div>UART, does that mean misconfiguration there=
 in this case?</div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/6944c92b-5a96-48fd-a74d-0d8fb0c0d3ean%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/6944c92b-5a96-48fd-a74d-0d8fb0c0d3ean%40googlegroups.co=
m</a>.<br />

------=_Part_5117_520621703.1613639230873--

------=_Part_5116_578149884.1613639230873--
