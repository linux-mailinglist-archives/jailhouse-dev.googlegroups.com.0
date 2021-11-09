Return-Path: <jailhouse-dev+bncBC653PXTYYERB563VCGAMGQEZR5V3SQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x73f.google.com (mail-qk1-x73f.google.com [IPv6:2607:f8b0:4864:20::73f])
	by mail.lfdr.de (Postfix) with ESMTPS id 5871544A835
	for <lists+jailhouse-dev@lfdr.de>; Tue,  9 Nov 2021 09:14:48 +0100 (CET)
Received: by mail-qk1-x73f.google.com with SMTP id w13-20020a05620a0e8d00b0045fad6245e8sf12639302qkm.8
        for <lists+jailhouse-dev@lfdr.de>; Tue, 09 Nov 2021 00:14:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=rGw4ivYtHp/LpBWCB1SH7l0iVusWG5oI3NMaaRYewSk=;
        b=OVMbp58sjrGovf+WwMCGTdEqiszozrd0hdibGkRLM8amMX7DmMFuv5REf5KT/lUKpH
         kHxV9IL0w6/oi6jofF5SW2uF28+FtSsq6Q9rw771wWL3rTjPj1SsIGvFkVnmedF/Uo2K
         ldMU2UDDDv0Awjp1flVHVN8/+KWRnHFKUn48YL9cmPs8tYrqifWYKHggV5BqExN0mSAX
         BEi+UTq4ZVPzT+TgXtaEB3wkCgJ8gp/gctN5UCeU4Oe6rBWtoHkVcSGqcRUP5atrmDy/
         azeFkNGRaj26y42TLLcoYC1iFN/SDMC9tiQq5xgc8NljAOTSHaRbss76cR/UE4RjYdId
         Plsg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=rGw4ivYtHp/LpBWCB1SH7l0iVusWG5oI3NMaaRYewSk=;
        b=AbjwZeO0P1xsi1D/KFYK4zBgfU3jfFkvQ8o1Xm47VlYGjPG76+UdGdnlFXfzzmhq0m
         lY4VaJLfc3VKuSwDxsGQZl02TZ5bKytFMIyZuQeglzYbPosWzdfdRFegOAtzMaG/XPHp
         /VsM4jw4PfGztkEtKzvkn+n/5c6YjLfjkjutg4qd+I8nImQu8rIKDearQMiDj/wt6rPT
         0Aff63DLRmrtWd/2rQ6TZHlnuaqQd9A/Ow4rpOb70OGoP/XhwqsA7lFDNKpBsx8zX2lH
         W8sElCxiJ8mtLTzwwfDmwCDwOcKctwXTAJSmLzd62AICO/5mO1jKvxBKoOUa5dzvUcL2
         nRLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=rGw4ivYtHp/LpBWCB1SH7l0iVusWG5oI3NMaaRYewSk=;
        b=h7ewiuk+d+UOHNrNk5+s4337kWTLDL7VljIklSb/04ZV4Yx/96cpkS0uxr8XcKLi+T
         BwAkS4I0/89+fpD2z/vOyanXTf1+WrTfwMCqktDdtScKfZC+kKb10OD4YbfY8gSZB0GQ
         2vKq7bMNzLNjIj0/agV0eF0Z3+4Cq1Id1RGRNf8+nzenlXuj2Kt3Lh+e56JrNPO3BUjw
         ogmKNcTBgORuSkuO6toibbfmU6UpEvWjz1Pu+jA4OcmLtTqRDqfdZgksffGfs7LKG0SV
         ujHQxKzL9IrpmZYe1kvL+lijJqIrQR7MqytCBm8tNpP9EVf/8kwLcDzuyoxxH75P5GJx
         Bcxg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533hMjEU4K1MIX20K4ZynCN+5bZkeJSZ8WdoW7LIOKTnvDt3tkfY
	PODIe8SkGc0EyK64J/G7Hts=
X-Google-Smtp-Source: ABdhPJy1QL9a8ThESWK75PltPN6OQpNxhjmYj9HubcUbN6heolqJux9eSX+d+EZFQ65XxnqXFyZ1Rw==
X-Received: by 2002:a37:2750:: with SMTP id n77mr4284889qkn.490.1636445687258;
        Tue, 09 Nov 2021 00:14:47 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:620a:1196:: with SMTP id b22ls10121649qkk.8.gmail; Tue,
 09 Nov 2021 00:14:46 -0800 (PST)
X-Received: by 2002:a37:a04c:: with SMTP id j73mr4433228qke.192.1636445686586;
        Tue, 09 Nov 2021 00:14:46 -0800 (PST)
Date: Tue, 9 Nov 2021 00:14:46 -0800 (PST)
From: Moustafa Nofal <mustafa13e09940@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <4619cf79-cc46-41f1-914c-9c1f119482dfn@googlegroups.com>
In-Reply-To: <8dce9427-624f-4d62-b803-3ef00552e283n@googlegroups.com>
References: <28e452f0-6d96-4db5-9c39-be0c148d12b9n@googlegroups.com>
 <20211025161715.61aa35fe@md1za8fc.ad001.siemens.net>
 <251534da-afb0-4c8d-b44f-28fcba5999acn@googlegroups.com>
 <20211102095459.3a17440d@md1za8fc.ad001.siemens.net>
 <8dce9427-624f-4d62-b803-3ef00552e283n@googlegroups.com>
Subject: Re: Jailhouse cell linux
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_44_771163697.1636445686006"
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

------=_Part_44_771163697.1636445686006
Content-Type: multipart/alternative; 
	boundary="----=_Part_45_1948323010.1636445686006"

------=_Part_45_1948323010.1636445686006
Content-Type: text/plain; charset="UTF-8"

One more information, when I enable jailhouse, the console types:
Adding virtual PCI device 00:00:0 to cell  "Raspberry Pi4"
Adding virtual PCI device 00:00:1 to cell  "Raspberry Pi4", 
how can I get the PCI device or the name, 
I tried this:
lspci -k | grep -B 2 "ivshmem-net" to get tje device, but it returns 
nothing, or 
lspci, and sys/bus/pci/devices is an empty path.

Thanks in advance 
Moustafa Noufale

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/4619cf79-cc46-41f1-914c-9c1f119482dfn%40googlegroups.com.

------=_Part_45_1948323010.1636445686006
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>One more information, when I enable jailhouse, the console types:</div=
><div>Adding virtual PCI device 00:00:0 to cell&nbsp; "Raspberry Pi4"</div>=
<div>Adding virtual PCI device 00:00:1 to cell&nbsp; "Raspberry Pi4", <br><=
/div><div>how can I get the PCI device or the name, <br>I tried this:</div>=
<div><span>lspci -k | grep -B 2 "ivshmem-net" to get tje device, but it ret=
urns nothing, or <br></span></div><div><span>lspci, and <span>sys/bus/pci/d=
evices is an empty path.</span></span></div><div><span><span><br></span></s=
pan></div><div><span><span>Thanks in advance <br></span></span></div><div><=
span><span>Moustafa Noufale</span></span></div><div><span><span><br></span>=
</span></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/4619cf79-cc46-41f1-914c-9c1f119482dfn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/4619cf79-cc46-41f1-914c-9c1f119482dfn%40googlegroups.co=
m</a>.<br />

------=_Part_45_1948323010.1636445686006--

------=_Part_44_771163697.1636445686006--
