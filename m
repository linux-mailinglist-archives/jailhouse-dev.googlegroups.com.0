Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBM5IRGEQMGQEDMMCPOI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53c.google.com (mail-ed1-x53c.google.com [IPv6:2a00:1450:4864:20::53c])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D6993F3F86
	for <lists+jailhouse-dev@lfdr.de>; Sun, 22 Aug 2021 15:42:12 +0200 (CEST)
Received: by mail-ed1-x53c.google.com with SMTP id b6-20020aa7c6c6000000b003c2b5b2ddf8sf247070eds.0
        for <lists+jailhouse-dev@lfdr.de>; Sun, 22 Aug 2021 06:42:12 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1629639731; cv=pass;
        d=google.com; s=arc-20160816;
        b=AvPcV0USwqk1h760+c6W6D9LCChJ2qWaiuGTK0FIfgVeznuEVsx9jRbMev27PCFaHr
         1AQIMUtkkF+CBwSEonO3VMSDfSV2rA/0TibqdkRUmD9ipSksvGj+cvV+uakg2gf2x0sj
         F1y+BeQ0oVRKw8hEO9v9xP6+dmFy/ogzO85JbOGtk7rfVWTLgkPz2hrSZeDgFiNpCWX9
         VJTfw6WTE9Xiu7TYycBthUiycmKm9NdyYiY8ylhji+MDKBMcN9G2J9vvLMoRd3o2Lq24
         DebOGf6fBfT85qJI+MWB81ah8qWyPH1MYQ/a9KzIoEb4dTvG3WtQFQMMOEwHAFcWo63Z
         H6mg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=Wbf+2QnPujzQJugoyhBuMI/J9GDsRMQSJ9x6dmuTyhI=;
        b=e8bWkudYlZ8vJtIhRSH6i+5lU4KxOY7CnXu2PkA+T8bXZV4gadPRJkw9Q62G6rMrmM
         SR0rh9y1l520dwVIfwMwQbkK8yu3Wnnc1e7DofOGutDBjX5RSfHW0QzP6JadXFEj6jH1
         9V588wozRcHPQOU2X8PgEuw8sCp3GawvSp/+pgphWNQZG2zNO3KIs4Y7CfCHgOCNu7Uj
         jIsIcljUCaLRO0/NfIwwp5Dm0vXvaYcY6/l5+2HpVD8ILlUTbL6g1vqcwSEV6i9xJ3+r
         3bS+t59pwLshNbkt/m6NoM4Q8es/DfolQucYhhmtZJrGiwfFci7Vk0Vbjemdd3uLTW9m
         h3cQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=EFRdnmmr;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Wbf+2QnPujzQJugoyhBuMI/J9GDsRMQSJ9x6dmuTyhI=;
        b=gAZ/wokoPo/Gghy+pm8SnmvpnIPx2FIMf03L+mcASU+d5bzR1GP23Dw+ii2mstld06
         tCWmFfrlgF9r2vGH91h9lrDl8G0z+yoaVbLnubYufd8jLK/07+W5XmYVnh1EUaCcBcxz
         P/+aOihk0PlrkAQvlm+y+Vu+OdPmTNpQ2c14cvOnuZL+sj06uneoV8LosKcKu2ej8LGc
         zXAiWbRRI9o7SeyEzXWMiOEnK5C9vBsmFeBn/uNgxK2fhQ2JD9hf/hFqPKcm4u0jbs+O
         X5fExOiMGPD19GaTurpJNgTkPQwXxZJ3tsOuXQIT98jwSnhKgjPqrbA+vMR7bycM7zSG
         3UZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Wbf+2QnPujzQJugoyhBuMI/J9GDsRMQSJ9x6dmuTyhI=;
        b=kYGIRcn7VVtROgRJNuPvpgW1rIRxdVtMHQV1TIIczkRutiB741qQEieqm7g4hVWviJ
         Eb3jYyVgNd3s5kblbsqtt8XaYEVClrQ6aS1PoZI7enMRI/kLXqkUptJVKyIw5dC3bEwB
         Zfubux0xkI/YGty/M37WaA7YQiYbiihnzyzwg8UgttqyenF7FjGnK5ofVOKy6IHRouJH
         K+/Srspapbwj7rTIx2Vcn6WtW8R8wVZeFn9JzxMFkHbEhznpW/XVw9Ab105FCH/w9VFV
         xIKv+3xFUTYNjyumiGtr0PpwH+SmIzkAWm/G5OhWrEkpjHBQdH2sxO7iprNnoztcSBoS
         FxKQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532BqPVG3ByNERW433lW2xakEoCmgqsIFYp3P7JgPOzcOn5JRNdX
	2WQqqzd2F9DxczZiu9B6CRQ=
X-Google-Smtp-Source: ABdhPJxNzPhzdH0kPeAQCXCBQ4Ul4fr9HhssYEZm173rLJTodb3IlDz+H1AFqgsP8UqOKDM1OcGepw==
X-Received: by 2002:a05:6402:50c6:: with SMTP id h6mr32182356edb.1.1629639731703;
        Sun, 22 Aug 2021 06:42:11 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:4a8f:: with SMTP id x15ls3707398eju.10.gmail; Sun,
 22 Aug 2021 06:42:10 -0700 (PDT)
X-Received: by 2002:a17:906:3699:: with SMTP id a25mr30724679ejc.452.1629639730409;
        Sun, 22 Aug 2021 06:42:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629639730; cv=none;
        d=google.com; s=arc-20160816;
        b=ZKWQOfBDkJ9pHDx7F8tjSeyYy/0gU6wNxlh/MSIygMYpMqqGV+c6nX62cU52rHSRW+
         IPSafe0Axu6aWB9LEiglf+u4Inc/gte9l+UxOE2WP5sv6MtuJacu0AXRbip2hFkWRifs
         pdu+oSyptjF8eiZ8BINljsc7z3YxAmteL1oS8UM1hbUV1enjvuzPwgSBX2FfIIiw6UQg
         EiXMYJVn71e/PUpuwjibJmfjntkOn01dXWC2+bdrY47UtiSy/2PJemds5iOpj2daFVvR
         EvUa8g4YObSE0hGoUlbd8uHR0JsdssXOdfm7UaQEQ3xoDTJ8vnTisqmbfgiReYiYk63S
         ka9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=BSXT04jqJ96CABHva0pkbx5JrFpXMCmTOlyd3C0UcRI=;
        b=QxQb171X34MmROksNm0JL9wgJKtVQA4dQcr7h6C8Ijxxeh77cMhc3IQdL+b5gEW1Cf
         K8qLW+ZreJBcYhzpY0LLbRt13k10mRnjl9N7bhpORUB/A6dRbJ6xwUQlZasUtfoRykuo
         mNujCBZ9o+p37sDdhyue4yd50oXqMNRUp7zWgZMmSPjGDxCOaXLUrl/eLrbZsIoVM+y2
         DS83VTOdO9vRuv43rIgQpKGRrBKb2x8rPTitKuog4f/usIWCZdkpf6xA4VMdTW0vZ+Kb
         6KcoH11LZjWSmi2z1tOHA1PrD6dVw6L1jaszJdugwcaf3S8OllaZXATR1pyfhEzJqgUc
         4ljg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=EFRdnmmr;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [2001:638:a01:1096::12])
        by gmr-mx.google.com with ESMTPS id w12si1056882edj.5.2021.08.22.06.42.10
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 22 Aug 2021 06:42:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) client-ip=2001:638:a01:1096::12;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4GsxPY6ccVzyHd;
	Sun, 22 Aug 2021 15:42:09 +0200 (CEST)
Received: from [172.16.2.139] (194.95.106.138) by E16S03.hs-regensburg.de
 (2001:638:a01:8013::93) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Sun, 22 Aug
 2021 15:42:09 +0200
Subject: Re: Editing Inmate to add GPIO for Raspberry Pi4
To: Moustafa Nofal <mustafa13e09940@gmail.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <cd1adc59-e867-4ce1-a6ea-371ae1754cdan@googlegroups.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Message-ID: <434c3e0d-3f9d-cef4-faa8-e94248176db8@oth-regensburg.de>
Date: Sun, 22 Aug 2021 15:42:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <cd1adc59-e867-4ce1-a6ea-371ae1754cdan@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=EFRdnmmr;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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



On 22/08/2021 12:45, Moustafa Nofal wrote:
>=20
> Hi,
> I build Jailhouse on RPi4 using 5.3 Kernel and it is working nice. I
> need to toggle a GPIO pin. I tried baremetal code but I figured out,
> that I must map the peripheral using specifically this function:
> p->mem_fd =3D open("/dev/mem", O_RDWR|O_SYNC);
> So, I need the following headers to be included:
> /*For munmap, MAP_FAILED, MAP_SHARED, PROT_READ, PROT_WRITE*/> #include <=
sys/mman.h>
> /* For open(), creat() */
> #include <unistd.h>
> /* For O_RDWR */
> #include <fcntl.h>

Do I understand correctly, that you want those header in your inmate?

> What could be a clean way, to add such headers into jailhouse, I have my
> own header-which describes addresses of GPIO registers- added to
> /inmates/lib/include, but is there any possible way to add these headers?

That's not the right approach to solve your issue. Having those standard
library functions means that you need tons of logic in your inmate,
including a fully-fledged operating systems.

What you actually want to do:
0. Pass the GPIO device to the inmate in your cell's config
1. Figure out the memory address of your GPIO controller + pin. For
   reference, consider looking at datasheets or device trees.
2. Map that address to your inmate using map_range()
   (instead of opening /dev/mem, there is no semantic at all for devices
    in our tiny libinmate)
3. directly write to the address

Other than that, have a look at demos/arm/gic-demo.c or
demos/x86/apic-demo.c. There we have the cmdline argument that allows
for specifying a led-pin, which is nothing else but a GPIO.


@Jan, BTW, I think I just found a bug in demos/arm/gic-demo.c: Since I
introduced arch_mmu_enable(), I forgot to map physical addresses for
map_range() for the led_reg. Will provide a patch soon=E2=80=A6

  Ralf

>=20
> Thanks in advance
> Moustafa Noufale
>=20
> --=20
> You received this message because you are subscribed to the Google
> Groups "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send
> an email to jailhouse-dev+unsubscribe@googlegroups.com
> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> To view this discussion on the web visit
> https://groups.google.com/d/msgid/jailhouse-dev/cd1adc59-e867-4ce1-a6ea-3=
71ae1754cdan%40googlegroups.com
> <https://groups.google.com/d/msgid/jailhouse-dev/cd1adc59-e867-4ce1-a6ea-=
371ae1754cdan%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/434c3e0d-3f9d-cef4-faa8-e94248176db8%40oth-regensburg.de.
