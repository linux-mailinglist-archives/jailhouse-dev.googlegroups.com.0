Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBSG45CCQMGQEI44LI4A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x237.google.com (mail-oi1-x237.google.com [IPv6:2607:f8b0:4864:20::237])
	by mail.lfdr.de (Postfix) with ESMTPS id 5583939BA1B
	for <lists+jailhouse-dev@lfdr.de>; Fri,  4 Jun 2021 15:44:42 +0200 (CEST)
Received: by mail-oi1-x237.google.com with SMTP id y137-20020aca4b8f0000b02901f1fb748c74sf2105223oia.21
        for <lists+jailhouse-dev@lfdr.de>; Fri, 04 Jun 2021 06:44:42 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1622814281; cv=pass;
        d=google.com; s=arc-20160816;
        b=CvZ6X5tbnToNYU2Zomvp0fXfHnPU3gUybKEGoLVtO9yfbKl+BfvP3FeiZy81Sfwfxv
         FSusWGgWOEcr1t7PXunYhhuv+7G5xDCCye/ZADAxewqiwsdFcHXY1GwGPvlU+frB9WB4
         yFjTFuHtP8QvnAJvsr3LSU1NU/b+mmURt9C0JWFCgs4BxYWPvBtCNnfNvLY95XOSoqFh
         G3qD2D0GUvHkGhvnZYxpSGPb3AhsTRgbcipTBcHziqnrFTkVF8KtNddVIuyHsGoLivOF
         8Cdr48Dd84D7hn3e8MYAiS+Kv8MwbSNs8GY962zwULOHFozZTPYTkVs0PcMPItBfC0MJ
         Sinw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=9Yfa5cXS3T1yDAYD2jCOlhXcq3DHXXch5Wpon1in1hE=;
        b=qD06eUm0h4vYXUuPOcAIkLagcPxpIcixRMczwfKKxFaFVgCKlwCgpqOLkqkBPwTsai
         p6rFE18+gx9PsTeVVAMAsSGPgl6UkS8m9UTMV7VBLtNr8OBl8RXASMaY3lv0cEWCYfxZ
         2rMdqBm8H9O++xQvlhdpiIidVHoXmEqlijXZjQX8vJBpMe3tD/fUyD95Oi9grl4ySBaN
         j967P4heyxlZwPUVd/UnQFflisV/Ffrcuw+vEELYbRyrY80ArQKjrWMrHbCKDGF0pcBs
         S6ca3pmQ+En3go9JiL5Sn880v8TqCrX4lA5tzTnJapkoQ9hfMouUsazxbgAnh+Qe5W41
         9fTw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=9Yfa5cXS3T1yDAYD2jCOlhXcq3DHXXch5Wpon1in1hE=;
        b=IQAEvCkT+R46MnIh+ASelTam9zkGADOJkwNO41rlIsoYR6zlyGkdMtYPL09M43gcCt
         +ZNP3xSeSmXqzCrrA18CyLkR8C/iYoBw4BM2qiJe3kWPgmAv/X7ypsm1HKXsWtxm8MYt
         b8cv5VlUNKhjcEWAUNLt/WCVGk50O+nBXcuzCck8+HbYMz/0KkV9veuCZYVs3WX2BwzO
         xhxXcfyQpRwvrRgOO0IvaAKsE+rEauV4r1h7gI9fAJrxTN1YkEn/tCNcyJJzWGD0Z9O4
         iZQ9VkYbWPYj1DC1AHZP4fWQnA0gJb2G84TFvRTKqhxJ6pT0GH74A3LofvrM9xHDtU2b
         2C4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=9Yfa5cXS3T1yDAYD2jCOlhXcq3DHXXch5Wpon1in1hE=;
        b=BicdwhgOLGm1A+FfUysW62tBgB0dDbmmmW+uf4QsLfTkj7CDyTm6L/yPI+7DbYX+i2
         xWNZY9Bmpw8qniq076FOkLIDeXB2ism0XapgRH881x6DV0Uop/QczX/YIeiqguOcXS/d
         Hfy9cS40ugLVLJVNAoZ3qkQwyLXZBxOER7RSnnce71s3fkfPgHMpPA+FoYadLEYl8Jz0
         TrY7UCMDBGdwl+voI+pUo/fq4iXrWqoyDHSm1owd2y7asUeGaHK0jUpPHVgd5T2Mj3wg
         7FRyNlsOEE79LtiYKAEZS7aM4JZBKPYWYCeIArfjIa3mT1Hs0ffh2l4W8ETHfyfI1yIL
         5llg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533JddAyPXlksX2mXvVzsAMXp7gBj3sjqSpEYFJ53oow2l1GVzZp
	MHe4W+O3aT6UlVNOcqmxk5E=
X-Google-Smtp-Source: ABdhPJzAbfRY9XFqeYSgYlIChL8IwDiDC3u8WqJU/cheUeBMkGb+uBJOe/t4Y9Cz1URgDqrd48L75A==
X-Received: by 2002:a05:6808:153:: with SMTP id h19mr10885075oie.117.1622814280839;
        Fri, 04 Jun 2021 06:44:40 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:5903:: with SMTP id n3ls1334194oib.6.gmail; Fri, 04 Jun
 2021 06:44:40 -0700 (PDT)
X-Received: by 2002:a54:408b:: with SMTP id i11mr3033802oii.132.1622814280456;
        Fri, 04 Jun 2021 06:44:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622814280; cv=none;
        d=google.com; s=arc-20160816;
        b=ubElPvSGXzA5dKI54cDfa5ELgr9Sj9AEftUp185G6pGeu2qcN2YXT4llWp6k7U7agx
         ZWSr3FF7p1DpHsTCbHHkIQqVRlGQClBZ4Hy2yxI6bXUlXOT76oiRZYfU7Ohyu3GyKvQ5
         o8S7G4UFBlbHmOcn3snuhAGKjXis+4Y7iK2kwUyW2d+7oQJrCi8aOZ79OEmIGUPIiK+6
         nScp9iw0ZjI0gKcKa8gbTW9K1JnvinATKiLEcdcwhMXQcg5hlSWlSUhz5dKe/htwJ4vP
         o79MSmjb8ppKyzoQumpkODbVPsWjoqixK/8tbW/f/5fxTR7cL91yW8bsXcMKO35+tgZn
         YBiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=ahvL3aottTcmxYqin1wtiW+f2uNjdjz8yiGomEDQhCg=;
        b=NaxEKcsjwS1NjzP3CTMJo9fDa7Nv8E0bkciNRtgAD1QboBqCxmVOESupr0EpEhZPQ3
         +EYsCwLTXSy0t77WfuCQ7GaQE17DILa1mjAbDRPHgTI29jnfJnxjv8QlPcKWMjuBqS8L
         iW34+tHfl0gAw+zWIRsBkeKV9aZM0S3Wuai5ezhPn7i+OGbM51q2+8/EbCc/Q5M0oRYL
         N3ZJjphjHonMYJkaB+5YsR9WwW1Kw/WQN70Sa5P4KaXZUpiHnQ6delW82sV8T23jLQFm
         MSk5gs8NGO+Wmt3TSuh4xvysvwkPjFRL0jWP5LmaposoNt2R8P2gh+3YRXpeVxWVf6go
         xs4A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id a10si271257oiw.5.2021.06.04.06.44.40
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 04 Jun 2021 06:44:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 154DiaT7004800
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 4 Jun 2021 15:44:36 +0200
Received: from [167.87.78.199] ([167.87.78.199])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 154DiZ4L023009;
	Fri, 4 Jun 2021 15:44:35 +0200
Subject: Re: install and run jailhouse on rpi4 board
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Nikoleta Markela Iliakopoulou <nmiliakopoulou@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <10331404-4fab-410c-ba3f-77f4ed6ccbebn@googlegroups.com>
 <8a66aab0-1fff-007e-5a7a-dc150fb15031@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <a2718c06-afe6-603e-e9bb-92e7518c48ab@siemens.com>
Date: Fri, 4 Jun 2021 15:44:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <8a66aab0-1fff-007e-5a7a-dc150fb15031@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

On 04.06.21 15:32, Ralf Ramsauer wrote:
> Hi Nikoleta,
>=20
> On 04/06/2021 12:24, Nikoleta Markela Iliakopoulou wrote:
>> Dear all,=C2=A0
>>
>> I am student in ECE NTUA and I am studying Jailhouse for my diploma
>> thesis. So far I managed to install and run jailhouse in virtual
>> environment (QEMU) in x86 and use ready-to-use jailhouse images for virt
>> environment for both x86 and arm architecture. Now I am assigned to
>> install it on rpi4 board.=C2=A0
>>
>> I know there is this repo=C2=A0https://github.com/siemens/jailhouse-imag=
es
>> with ready to use image for rpi4, but I would like to install it
>> manually to explore better all the options provided, write some code on
>> my own and test it.=C2=A0
>>
>> I have already explored the internet and this google group for further
>> information, and apart from some general guidance, I didnt find anything
>> specific/(or maybe I coudn't understand some key points).=C2=A0
>>
>>
>> I would really appreciate it if someone could give me some
>> advice/guidance on this subject.
>=20
> It's basically just a few steps:
>   - Take the distro of your choice
>   - Clone Jailhouse
>   - Clone Jan's Linux/Jailhouse tree [1]
>   - Build & boot your own kernel (you can refer to the config in
>     jailhouse-images)
>   - Build and run Jailhouse
>=20

In addition on this target:

 - adjust the boot process to use TF-A
 - inject memory reservation as DT overlay

Finding the right combination of versions yourself can be very tedious
(I've already spent many hours on this, again and again). So it is best
to follow what jailhouse-images does - or, even better, build your
customizations on top.

Jan

--=20
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/a2718c06-afe6-603e-e9bb-92e7518c48ab%40siemens.com.
