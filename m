Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBTW7V2MAMGQEMSGPSZI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13d.google.com (mail-lf1-x13d.google.com [IPv6:2a00:1450:4864:20::13d])
	by mail.lfdr.de (Postfix) with ESMTPS id 02ED35A3F03
	for <lists+jailhouse-dev@lfdr.de>; Sun, 28 Aug 2022 20:11:29 +0200 (CEST)
Received: by mail-lf1-x13d.google.com with SMTP id dt8-20020a0565122a8800b00492f7025810sf1361147lfb.3
        for <lists+jailhouse-dev@lfdr.de>; Sun, 28 Aug 2022 11:11:28 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1661710288; cv=pass;
        d=google.com; s=arc-20160816;
        b=KcFnEqA71INVpVkAWdXyXo+wZrPKZqLN5a/zo+PG+ePyQtkmcLGGelpWXpGZdwejRy
         +7zR4kg2p2JBUPdqoWLsFznXLDwdqq9APw0XuQKU5b+LYbrgq/7L6Rag35WYrKp5niUC
         /p9mpQhjtzZTMyPf/mkySpEWK3iHWpj/6Xrm3D5tQHK4EoV1LhD20CdsLpdaQL6pWkI8
         iCuYJf9RD7OLrNiIkg5gcUnC8INDxoopeg6fD//5ASpzB4/2M59tFpZMa9/9mppNabw6
         6dOd6enookAGS9a3eTWTaYW/kVZmP0Ty79Q+6aQnca6ktDKdDoyoRmH8zb9CIsrdBxm/
         7irg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:dkim-signature;
        bh=GcSrSIzbMVB95EeN+w/ETep9BjRIIIp/Tn3e2XHD1DU=;
        b=k+4hoXk77nlMTy98BvE0YMaUdYwJHloWpUkhuOxayo67Z52ujWhhrOu9ZjXp22FhO1
         qhwati7sm8kR6VFKttHQS5kusZSG57V35o8VWq97pLW0ksbdGdNhonu1Qpu5uAVYwHk9
         4dvNh9UANP5YrvVYWZv83V2o8WvPdB+UXKtecOt+DnIcui6v3g83m2jYwlbjuqndmuTu
         9hnTzlHCeSz1v7AyP1Y3OkB6qlx/dhEVe5KiwzpRhf533vnYnz8fxdsUe0lQ1wWyTyvG
         PaDvBeJ9of2Bq9V0uSf3XIIQpGDaodRJKO59WDDR8tbJPGhmlNtnChQ38flg23oi32e/
         zSaA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b="itk3m3/M";
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc;
        bh=GcSrSIzbMVB95EeN+w/ETep9BjRIIIp/Tn3e2XHD1DU=;
        b=Ikk4QufNqTY8fJ7/KM9xawMGsrBtBfoqQSOUinbcWYdn60qELXryKSiotMpnqTaZhg
         RIV5bA3IEFECCBVRlUtMPUl4eA7oUTDSBNr8gUmSOKHqashTBpuxQ4Pk3GL7KwSt1k+L
         cr1nFjIzvfeVEu3OlQthB8Nwg2JSKPpyjG3gChvRJ5lTXxRXMZO9NB1b3Im0p2PMxA3p
         sbd/v+pzsVmSSHOdCQjl8VyQahlR16aOsA1HakAKqdXE8PQ9KPoUx6gUlalwEl8lPRM6
         iodHFozkoMuJN2sm2nXlW44bgd7Sp7pICY089MuQCFCNLYQJj4fwBXdWAZaNn69K5ZRM
         60Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:in-reply-to
         :from:references:cc:to:content-language:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:sender:from:to:cc;
        bh=GcSrSIzbMVB95EeN+w/ETep9BjRIIIp/Tn3e2XHD1DU=;
        b=qyOT7gCARo/um1buoUQvB6J9PbICN+bRZDjKchihRoX9LTI1pRN2zDhHRtBVf7V+AR
         h7Szhx7203yJlW5NWXAVlc3xRC4jyOeazOa53EyjqGXNN/fDLiru+iJcbIHK+js7Iyvt
         6aCPNZzm6iKXiXD0DS76YsBYTSga3jp7X75pOwt7pFxj5fQTVqZ4eg+9oJ2CyD7/7TKW
         bQPSXchljJxXlMD039w3ic7yRpRYbFAqrHUwv2SCyMZettpMT+73o2yUwaBPVVbQTTh2
         qDtx8DRE/kgtEn4+X3Ni4ZWRxSZJpZcw8/YahMz0XvIP++w5NPyHgosfRKFI61e7TJ4N
         5seg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ACgBeo1NmspI7NRKruGQl230wAjpXraaIC1mbYszfvrVRxTG/fgbQ79i
	JfwX4wYajv8X8LBckOPkXUk=
X-Google-Smtp-Source: AA6agR5kdu4cT/9pqA6oZU0ilgtKsRyot6b4+kOWomLXsRq8o3t/mPX87SgNW07HZLrsx1m/xTg0FQ==
X-Received: by 2002:a05:6512:304c:b0:492:cd69:6cb8 with SMTP id b12-20020a056512304c00b00492cd696cb8mr5866201lfb.551.1661710287863;
        Sun, 28 Aug 2022 11:11:27 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:bc29:0:b0:261:d944:1ee6 with SMTP id b41-20020a2ebc29000000b00261d9441ee6ls1263624ljf.0.-pod-prod-gmail;
 Sun, 28 Aug 2022 11:11:25 -0700 (PDT)
X-Received: by 2002:a05:651c:2205:b0:25f:dda5:1e65 with SMTP id y5-20020a05651c220500b0025fdda51e65mr5072258ljq.240.1661710285875;
        Sun, 28 Aug 2022 11:11:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661710285; cv=none;
        d=google.com; s=arc-20160816;
        b=Vgcz4E7OEFFHy6oKQMrocHo7s0dExEH8ccSJHpnjD4/wHW49vtZqnHAiXV74Q3gD1o
         37KBTB3KoZpxhfnt9ZJFDnBO07t5sbPsn+Iq/owRwC82/BpOU8/Dc9BifEqczpTNyKvp
         9X1w5eFfacWdXRG0D79BqGeknL3DdubSA4oMJxrCeDTq4O6FYtiMH5Z5wtHSkZhi0P+M
         Iuug3mes0EIazTSuqvgQRHg2oSookztiLNws9Z+Hcl0DBkSQnUD/8DVQcDJ/ZvDvf03j
         yfCaf8MzS1wlDIwTlr32n1IPdikKZeOAj7vewXyuAYLlM9sqKj/Uf7pGL5+e3FDE4Nov
         bN2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Rrjc4fp/G4O9yCFz1SKCCYxFK7qHZ+AGrlGh7HC3avI=;
        b=CfrCJIHpKWa39P+fQWwnhSJtgtKAWEMgRFlzUjr7eXO3srJ2/YElZuQjQqpLoyH+mQ
         20r+hmeBMr+IOUfyjkHSvoyLK6IHNJbZZHc7TvaNIs0R/lqI6hMFI+NJKsGQ7zj/iobs
         pvQw/hxPz+aHaK+J05nlCAI5ia56nq40RuHCzvb73DRXSjFWPUm3kGfm3M/KNVFQMWEZ
         yVEBwFYIRmtNZEWIRfvIyMmAltu5nz/waha/gB7QmVf389hHT1EHSmiOx+YFeGag2Q1u
         sp3yQipB7vrkSVMqTpOFm0E88IZcMcQEquh0uj3gxZNTKDqHWpmN+sOduUyfxjeE7izb
         LHrA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b="itk3m3/M";
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
Received: from mout.web.de (mout.web.de. [212.227.17.11])
        by gmr-mx.google.com with ESMTPS id z19-20020a05651c11d300b00261eb78846bsi243121ljo.4.2022.08.28.11.11.25
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Aug 2022 11:11:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) client-ip=212.227.17.11;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.178.20] ([92.210.49.225]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1M1JEu-1oPbb40U6U-002yHM; Sun, 28
 Aug 2022 20:11:24 +0200
Message-ID: <d6e6b2bc-706b-22d1-c36f-15caff0aff3a@web.de>
Date: Sun, 28 Aug 2022 20:11:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] configs: arm64: qemu: move virtual PCI controller
Content-Language: en-US
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
 jailhouse-dev@googlegroups.com
Cc: Stefan Huber <stefan.huber@oth-regensburg.de>
References: <20220623212019.150691-1-ralf.ramsauer@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@web.de>
In-Reply-To: <20220623212019.150691-1-ralf.ramsauer@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:VoXpTYEWJuKtOQVEwDoB3FN+2JoogtDvu1H3thfWCg+zml98/N4
 XiQBtlpdj1yPiiPyOOA4JzQ13i/shcY5hrFHou4UFEtuzj4yHOwPMKnTwACVf+VQM+5li1b
 dtrtCZovB3a8za5P7caDsk8/MAfEjxYEYpjvgqJmZnfWCbDBxdQaCATfGS57MibJCHGVb6K
 E+E4ZYezSNoQHouKGlLmw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ZYFxFe8FC9k=:gKFwL9XYBZ8voSW0bAV7D3
 50TCGJatbT5d41xPWnLJkhpFdPXpx9K1Mqcmkjd296jnb5tWvokBYlZCLQoIzZPJkygxUEdPu
 ZVa2LN4Lpl0IbdycuilTEkxR1goQhe+MQUkgIzw/vZz+T6DLVgexg3KO8t1y01tUCNCNrm0pp
 XmNCcnH6kVUkP+eD7FpI/aFR41YlxBUOg6lcmdkGMr5ABPzcnja8V0ALllLG4svpv963ugm0U
 tx8GF2AUwQVbi4nLBJEOhLqieLUwVtXXp1nQqS0QPsG02QsEUAB5KuFPNTgAKjy25z/l6nwyp
 KAFcUcFotYhGCzcLc8e+pQXmUrAaiOpavxXx/wiBLdClc8r9AgEReXzUH5SB2a8ruYlbN7Gra
 7NeqFs998LQJwg+z7oBx7LKSb+h5RwWZbBaVApY8vEAw+D8wevek1S6wqk5PhU7Hf40kkqeBT
 +wsei4CbPH+6pbdkCEqAQhE/PZvjU+BwosvfEqu8dbtXCKOhS1cBqXpWhUIhUWU7Wt+LgXK7o
 jC0jcVnX0F15B3TEKbE+wnXerA031mjahIYbVlYIO/2YctlHtmkA/EVtnDbuQXIR0RU/5o5X7
 o5dkiGqzikVc1P4bxX6Un8ZpOnSE6zlqwdxU9moj2pe9fZJ+FEYZnTgg8qMxXZL+p+cEo98S2
 BUifMOnjDul5IuCrOWYVWCMyZ5pljJu99GJDTISHaypnyojE3Vab4WIj/2JejWx9SuiqmKoy9
 CwXwWpwhdddW5ZT25gGOP38O4UhCeO+VC2GmbKjE6nacDwnf3QQlvaY0hJ+uLK373ObD8nLy3
 cMxGkqupA4Lg9IWFWBdDrLEIB8NSAzJcZfLmy39nTU0Mw6RdB9Ld3DU9jrBbfw2PXsvbaKQnd
 FgiZ8Tadc/HYdQUe++pI1DE1nDXbrfmDGqWWE6zHkyqhlHTQUISIxZdmq9gN8wq1K0qXp0Ehz
 F8FTI/RwVf+VUmQt/G+Hv2KkIy6daPJ6yhrIITw7OdAk9OEnEVMRVTZJvoM5hPPJhBu/q0Y3q
 SCAU87WhfT+zH7o1nHehOVhiAQpQ5Ae/+znziKxLk/d0agUzyISx1pykaAFquhMSQmmTqgIga
 XmHsF/bjkByyfDso3GV0yi16LCVxp2n4OiA785W7jEqZp34U5l2rXZTJQ==
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b="itk3m3/M";       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de;       dmarc=pass (p=NONE
 sp=QUARANTINE dis=NONE) header.from=web.de
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

On 23.06.22 23:20, Ralf Ramsauer wrote:
> With recent QEMU versions, the GICR grew:
>
> $ cat /proc/iomem
> 08000000-0800ffff : GICD
> 080a0000-08ffffff : GICR
> [...]
>
> Hence, we can't place the virtual PCI controller at 0x08e00000 any
> longer. It will collide with the GICR. Move the pci controller to an
> empty spot: 0x81000000 provides enough space for the controller.
>
> 0x80000000 can't be used, as it is reserved for the commregion.
>
> Note that pci_mmconfig_base must be within a 32-bit range at the
> moment and can't be placed at a higher address.
>

This is just papering over the underlying issue: QEMU now emulates ITS,
and that resource moves more things around. But Jailhouse does not
support ITS yet, so we better disable it in QEMU (machine attribute
"its=off"). But we will also need to tell the user which minimal QEMU
version this implies.

BTW, this patch would leave the Linux inmate broken (missing dts update).

Jan

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/d6e6b2bc-706b-22d1-c36f-15caff0aff3a%40web.de.
