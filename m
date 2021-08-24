Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBGVPSOEQMGQEIYXE7ZQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x440.google.com (mail-wr1-x440.google.com [IPv6:2a00:1450:4864:20::440])
	by mail.lfdr.de (Postfix) with ESMTPS id E40C53F5D0E
	for <lists+jailhouse-dev@lfdr.de>; Tue, 24 Aug 2021 13:27:27 +0200 (CEST)
Received: by mail-wr1-x440.google.com with SMTP id v6-20020adfe4c6000000b001574f9d8336sf1652297wrm.15
        for <lists+jailhouse-dev@lfdr.de>; Tue, 24 Aug 2021 04:27:27 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1629804442; cv=pass;
        d=google.com; s=arc-20160816;
        b=W/Bfyp1tOiNvLGuyE66og1iI801uBp7eZlLUMN3JhpalQq4NiEERXAcSeUb10WRaOG
         jWjyya6b5TOkrxSbF9xs1LquDbNt1/H9bfMRlZmk1Wte3ME9ewVjBVCPfAXTai08l+Y4
         PHwKRoEhp5n8ZxfQEMfWNp0N5njd/zPh31lWAYhHkceLoF5u/XHBIAJ6G7IQ1EmlR6P9
         5bvKM1E2Q8EczXuMvvThvcdHhM/Yh/UvTtEMVJn8DQRG8lsV0tQVcEwogFA2RBkx29tr
         +y5zNfAaWs/f8QnBjJa0T604rzg7lYXO/ioEnP50KjIJmyT/yUHwYye7N/PI0l5MZ1Pt
         933A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=3+NFaLetpy8QmWcfXkjwbM4PUmB8NIEBv9R2AnIhrj4=;
        b=t8YwETQ5Hrbl+GBB4X1GDgBcX4pUzSVHjbV/UripPH5AoLjCdh83t7vR/awGXjsiG+
         fCKx9KOHuatiaJcE7DjjA4WoCQWEMHBBCQkllFGNBJpuVnjwF2+fODyZm6nhyAEjVgly
         Olmk+xP+FJqo7ux3YCbsxj+QAzyY9heq438/RYU5VkWMvF74Tlo2C5NEDoFb8RMSalNL
         RSBXgvX7WrbPZaSebSAlWJKOcvsOA4VOjL/N67poCoHsdCQvb5JTuGkvI6RcTjYTIifY
         BxFiWiPHAA2THTGF4N3JF2B38BToUbrq5z/JE3zNYGnd19eaWGEatppTMgWwQGsRnJdn
         JwEw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=B5qDyaN7;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=3+NFaLetpy8QmWcfXkjwbM4PUmB8NIEBv9R2AnIhrj4=;
        b=Xo2G8DhYgkCvbhV/ohRcD9wXUqyofT4M37W7oteYxR9v13sw454Kp9C1l1+k6pjhOD
         /oyON0JqU6zoSuoFdMhUpcu9FSg20Q3mhAVSOARVwmCCpht2Dpp6lnDhcPXuUK7Y02u/
         44rsIhg7Q5JiF9LT0IA65YlISfMyyfNbWMHveThbmRo2VWHq6c2MCyxjTo18cOERZFvx
         pCuVDd5Z9o0AK9HUm7T1++6GcU5o2Jw9TYAhdnag/TyHFPtm5E4mc6K+C60bgsKLcBaX
         jmkRQNeDJFH7lA+g3nfxJLJ1oUE6DUVBw4WptW0G5PoYPXNC3KT0OzKGt0Ql983OQd//
         oRgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=3+NFaLetpy8QmWcfXkjwbM4PUmB8NIEBv9R2AnIhrj4=;
        b=NLu3TsRPEJCyYmgZ3+uE12uXi0E5N4RC1mo0YZYr0Gfp1i1ZKgOkMG86nsaJ12okU3
         Of8tACA9lbK3Fy1WRT1TE1L2o4tC+JschUoByO0pmnoycChhHVJHDYgSrOY4LRagVkV3
         rK9cBcatnoaXowPuIYhJy4p5db4RUpIG7v82CPsx5OI+5DNLj52h+z0hCeInaGkyAMwK
         X2Q2+IxLFPEWX1vfzq7fqFMFd7s9tQzBCEu4YrvIPUaUnZroJP4gKsfrWECytRpMuHLY
         4DbzA6Ivef2FMN41ES68BAlvgspftsmrVGdbME5/nVMiZlU0GiOsVzVCt7CG/04qT6ie
         GsRA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532X9QOUc1p0KOSTicLeYCx+ASZnv1cueULL9W7W6VdTwMqvlbZ1
	8DS4gn8QwZDDfj6D2ZTCiJw=
X-Google-Smtp-Source: ABdhPJyMGZHv1rPen4DXrv2NklIUEesMibX0edsY/B/z8SdJLnk3BR3Z+9GL4xh9N2RjtGelzXE/Vg==
X-Received: by 2002:a5d:63ca:: with SMTP id c10mr7502782wrw.16.1629804442447;
        Tue, 24 Aug 2021 04:27:22 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:4a43:: with SMTP id v3ls571584wrs.2.gmail; Tue, 24 Aug
 2021 04:27:21 -0700 (PDT)
X-Received: by 2002:adf:ce85:: with SMTP id r5mr1285563wrn.323.1629804441475;
        Tue, 24 Aug 2021 04:27:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629804441; cv=none;
        d=google.com; s=arc-20160816;
        b=LhNUovxnADoXMbv7oOLaAb6fOkSIii0XyfCJJZBgjrVuNqPTu2eB9ECRwW+V9JeJvL
         1OJxOyjqSFlwMil2Dled397siz5/ceZZRo1uEHa2rQarbpc+4jb5eQIXzggTJKqNQIqq
         yioAv5QyoVz4WzMci8ZpS0EXjL1XXuKZKM8f1gesVQbEk7L+fiASgFSq4HtB4EZF5/rx
         6SlAPJj/8HypmNpMpULT2LipJ3TgA14kgdShJxjmOPDCG+efouz2iu9nABS6+efwg14S
         XVJ11uKxPWNxxFU8jYLUYiBaLtYJ49XDUkpf3lmN+hoeYrgO7epfQ2WLLLwEf1kaUaGt
         ekBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=5fMhG+wxeRggwW6tTbs/mtvHNqU77ZQ0yCfRRDLHiks=;
        b=iZ81IcCDCbSfrpZjODWnRNRFJXA/7Ts3GncxJfY81AhnOpg5NApRdgoBvoIxgUmXjT
         /9jCB8/By9NHmGf9JsFVUikgWKwB2hpAbanu5AIL2ChYM+p/eDf1Rsr0qTrsQQKvWM7Q
         DnvVqDBS12x9xy+Cq4d3f7rsfYkQErY5j7xKhzt7PjzA6svMN4FCgaSHG5DBas+LtDpP
         SCPeHbAldsG4lRarucguUFmNLoeLdVGvf5yyJE4XwtK4VKish9c49me8ejWY3IxDD1IC
         N0Y0R3YRbvYea/a4rL0gYj6ta2D9ruHOfFCfsI+P0dFbQLse2AZFTj44sWVGGTXfghU0
         Uv/w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=B5qDyaN7;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [194.95.104.11])
        by gmr-mx.google.com with ESMTPS id z70si181801wmc.0.2021.08.24.04.27.21
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Aug 2021 04:27:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) client-ip=194.95.104.11;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4Gv6K50Zckzxw5;
	Tue, 24 Aug 2021 13:27:21 +0200 (CEST)
Received: from [IPv6:2001:638:a01:8061:5c51:6883:5436:5db]
 (2001:638:a01:8013::138) by E16S03.hs-regensburg.de (2001:638:a01:8013::93)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Tue, 24 Aug
 2021 13:27:20 +0200
Subject: Re: Building a Baremetal OS for Raspberry Pi4
To: Moustafa Nofal <mustafa13e09940@gmail.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <e76f8186-671f-45c8-afc8-8c85b3988c43n@googlegroups.com>
 <dd34eca0-5093-ef58-2084-0bec72ac1b82@oth-regensburg.de>
 <ccffba76-599e-4776-9c37-691de5de7cdcn@googlegroups.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Message-ID: <e69d0408-a3db-7f6f-75db-681719a44391@oth-regensburg.de>
Date: Tue, 24 Aug 2021 13:27:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <ccffba76-599e-4776-9c37-691de5de7cdcn@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=B5qDyaN7;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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



On 24/08/2021 13:21, Moustafa Nofal wrote:
> 
>>Please attach a patch. Otherwise it's impossible to know what you
>>exactly did
> 
> I am using Raspberry Pi4(4GB), Kernel 5.3.10, Jailhouse is working and
> added GPIO support.

Please describe your *changes* of Jailhouse, attach a patch. Source
code. I need to see your code in order to help you.

  Ralf

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/e69d0408-a3db-7f6f-75db-681719a44391%40oth-regensburg.de.
