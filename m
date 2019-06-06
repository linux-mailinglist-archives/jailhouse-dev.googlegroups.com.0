Return-Path: <jailhouse-dev+bncBCTN5UU44EMBBRHN4TTQKGQEMBRGYXA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x239.google.com (mail-lj1-x239.google.com [IPv6:2a00:1450:4864:20::239])
	by mail.lfdr.de (Postfix) with ESMTPS id 707D73788B
	for <lists+jailhouse-dev@lfdr.de>; Thu,  6 Jun 2019 17:52:37 +0200 (CEST)
Received: by mail-lj1-x239.google.com with SMTP id v12sf649950ljv.7
        for <lists+jailhouse-dev@lfdr.de>; Thu, 06 Jun 2019 08:52:37 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1559836357; cv=pass;
        d=google.com; s=arc-20160816;
        b=XKna7UZgDXKilszejomiAwl3o2xfXc9RCFKs8qp1rj8KFwqWRE2d8d3VPMrUf6gEYZ
         05Xr2GTv8w+/XPzFyLYw7RzdFuoowrQst8bgbSPo5TQXon/EPHXENYCYWXrNhxXETMO0
         vSU2suqvmm0NK9kPg2MnNSqszxk9f+1MKbGZR11KfrhrUZoenqgmi1hDg6ItiPP+KqFS
         UrX4+Lp6i5RTBX8GRTfP95qnTCKTPnKCrjs0sWwsOVCqLju9xic3W3CVZVBPmT+/YntD
         ZVMdAYsyJxulTlm1gq38Da3ZJbbTQvnGjlcRbKVCUHAz1PAkxLir9ykOaVR+EhNH2wRT
         Ko8g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :cc:to:subject:sender:dkim-signature:dkim-signature;
        bh=grVHPGkoEvBVAjFIXZJ+K2ELlsTYYnwux+8tW1h5YSw=;
        b=ADVAtVClmUi2UupcnCxlOti+qh7r4FGzBANn2b4kFO4BehOz8P5k6V4JefDibTc+a+
         oXZYksin7WE/9CxNsPjDdoEGt5KiozR8GWAd5nX7yg4tsXKQ1baPlY+jiYOJmAPYJXiz
         MYvaEXU9wOvL6+6VK9u4hthyi2MQ+72SVZ8plV+XLTY4Fx6jXSrSacQQsrH3KoRSoIO0
         nfuNrs8G31nSDL6CPPyFA/wxEWR4dwZkobnh3J1QrfygksXhfOg/1ObYYMYfg9tUCUuS
         Z1TeGd0/nDjWzoD3jXQdr126ZXN4vLOc0yHJTf5e2WuW1nKchqT4nNF9cq2HgicAZ7kT
         U3wg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=COXuYehY;
       spf=pass (google.com: domain of johannesmaisch95@gmail.com designates 2a00:1450:4864:20::332 as permitted sender) smtp.mailfrom=johannesmaisch95@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=grVHPGkoEvBVAjFIXZJ+K2ELlsTYYnwux+8tW1h5YSw=;
        b=Qho9V/spTyIGi1SbsjM8iUEuVG8DdAihLAWXp7JdhdIBVG0lK/QTrkKZh640JLYW/h
         4ThE9M2xz5/0yN7naTkaTyn00HPgJZ2jyiRbk502x5QOewO1TXwQK8/0wgLOrLdWwRHD
         AW+YjT5aSjWI5nLi4Jtn9QQ/tieKyxbsJm1pcJFEfZqOLaJEIa8pQuuIe1Yvot3Gpp/F
         w90iPknZniII0Zgnd6H2p7bMv7YJaybd/ZOahpO80CNEpYHrAxhuQCRPqCIFGMJoDfpQ
         NNydGeGYdZpnBu+Lfh1bS+2gD9ru3uCqh/udBga5/nPJdcJaLG7azfLYrSvp/YLA48Qt
         UpSA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=grVHPGkoEvBVAjFIXZJ+K2ELlsTYYnwux+8tW1h5YSw=;
        b=ka07PVHZ11uoCAvbky11MIqI4mC8tSVb613xYHXT9JednSFM81PRxSraoHTev4tRtA
         SBsfb4fEBZ3R4AihM4zHcHzuB3+HRqFmWE8GZiE3Y+AzC9RCPWBHsoQhCsW38iJgK6/f
         BMlyiFcCKjArQUi+rzQ2aaDFrKoG1SolCjvqIuqiDgdtcu0ibDl2RP5i/qoeLzyywDq7
         zdQpfDuaG6J7Jjsk6ij8hcn971WHg2pxXZwcwcrr1Olmpv4kLf9ga6/XOjgLxONHQavY
         ETEHLfaFURCN34nQiKD8JaBD0e0M2R4YRPtuWq2SgcAygqfD0eDhZpPFT6AS/zi+RidZ
         LhEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=grVHPGkoEvBVAjFIXZJ+K2ELlsTYYnwux+8tW1h5YSw=;
        b=RF+Z64ZwxV1CO4zKN8PEmUBWgQu9BLtNqvO/v5BWHh+dyE7BTLig4Yk9vMmOydcsL5
         DaXpUw809he8zZ3qX0atSkQmsLKEi28583EetHtUjxPrlP7YxbBVM9W1JsKc/LCUTVHK
         cNOlaf1ziF9N3yjE0mvknGJxOdByAAnT08QXWK/Cti26hVFsqYY+jM7drAwb9v9pZWUe
         lUa7qlVGe0kKXtSdAOIQSQiloJjSa7XItEmbAojP+h6fmQZS7aBL5xq73VIVKbyVFhdr
         qqyeeQBfSJ3q22qdxT2qp69+fVoC7OD/gJ8yjqsXEOT9+86I0tVzti+3pFcnfs/28aSR
         7Rqw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXkSlSXOVmH7iZ+Ibf5rtHND9LkasS0xcExy1tgRJ8jVyxuOJJV
	X0JGCrNkZVwxVxBg6FgATKI=
X-Google-Smtp-Source: APXvYqylTfywUzhs1YK0wVtvocepzPhcUsMqEvpBzJXsEQN/2YhOf+Z7A9rwbT4N7FjZ4pHGOa0n5w==
X-Received: by 2002:a2e:968c:: with SMTP id q12mr25208064lji.195.1559836357077;
        Thu, 06 Jun 2019 08:52:37 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:7f09:: with SMTP id a9ls244785ljd.16.gmail; Thu, 06 Jun
 2019 08:52:36 -0700 (PDT)
X-Received: by 2002:a2e:988b:: with SMTP id b11mr10562387ljj.85.1559836356206;
        Thu, 06 Jun 2019 08:52:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559836356; cv=none;
        d=google.com; s=arc-20160816;
        b=r3z9ZKvAwZ4q6lSHVwduxOgz5qHQ49DvjmrJzetKFOqlny51g5xKGaDN/FHI8cZ0eb
         r6ePWvcE6vcHcz5iYAFYDtndt7ASZy/Kvz3dIDHsvalIm+X9K0GHL7fZQRsfp3KP7ktf
         uvHJ8+ERN9LGVnZ6C2+SLlmWgrSeYee4ZgT0paif4nr0eG/GCWGt1yAeO4dppI2TJZ54
         pSM8UoXfkz4IlEecX2CKW22ZMWhDwupLJhEf8fJMc7reM53srJtt0mYxq28hLpUKK+zB
         JLn5KLbURuq6n9cMMbOQdTZIRyjs63UCbUnDyzJ3EGplOolbOJa79FheUISSih/ubT+t
         k/bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:dkim-signature;
        bh=lPg2ghgzjEa4D/yd3ZfSMNCQouvMd4xoyGHqUF6F22o=;
        b=CPZ04bAo33I0ulkREORCnTAksY7VsnZC6ZQAaJiA+yyv5QJ4wFWBzlM5X6t89lR1UH
         inTqJGUJcl0RtEtgDQIDZxm78uWmR/uIMuXYzUh1upVdDaVwr0v1lAD5hdh8cdG+3IJc
         OCVt60usftAVOEmqGVC5OzdOAV+H0Fo68zDzxOS2chWz7Vnr12mBGfToJ7ThCsgpJbBr
         RaByEktktHQUuZTZKoxz32tK3ATsnGwDBgJQ/pZSNZIJS1JSC9hyfyf9RYuGFqbtL7gz
         YH2squnTgH6C+306iGTpxSfN+LZelUAxk7gGj99OsTaEGkKlyE6GcbB5iDGGMnnXupba
         1ceA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=COXuYehY;
       spf=pass (google.com: domain of johannesmaisch95@gmail.com designates 2a00:1450:4864:20::332 as permitted sender) smtp.mailfrom=johannesmaisch95@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com. [2a00:1450:4864:20::332])
        by gmr-mx.google.com with ESMTPS id v29si138890lfq.2.2019.06.06.08.52.36
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Jun 2019 08:52:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of johannesmaisch95@gmail.com designates 2a00:1450:4864:20::332 as permitted sender) client-ip=2a00:1450:4864:20::332;
Received: by mail-wm1-x332.google.com with SMTP id t5so467455wmh.3
        for <jailhouse-dev@googlegroups.com>; Thu, 06 Jun 2019 08:52:36 -0700 (PDT)
X-Received: by 2002:a1c:7d4e:: with SMTP id y75mr481899wmc.169.1559836355523;
        Thu, 06 Jun 2019 08:52:35 -0700 (PDT)
Received: from [192.168.178.53] ([5.56.211.151])
        by smtp.googlemail.com with ESMTPSA id y184sm2799316wmg.14.2019.06.06.08.52.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Jun 2019 08:52:34 -0700 (PDT)
Subject: Re: Freertos-demo bare-metal boot
To: "Dr. Johann Pfefferl" <johann.pfefferl@siemens.com>,
 Jan Kiszka <jan.kiszka@siemens.com>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>,
 Daniel Schmid <dascit16@hs-esslingen.de>
References: <f8c8bb48-ac7a-4bd2-a554-0f42a31fa5b6@googlegroups.com>
 <90eb1048-d5b5-7dcd-fa9c-ff9b715bd97b@siemens.com>
 <20190604102704.7xy42j25eq2h67rq@jpc.jpnet>
From: Johannes Maisch <johannesmaisch95@gmail.com>
Message-ID: <9d12161b-a004-ad5e-0dfe-1b1c249358cb@gmail.com>
Date: Thu, 6 Jun 2019 17:52:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190604102704.7xy42j25eq2h67rq@jpc.jpnet>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: Johannesmaisch95@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=COXuYehY;       spf=pass
 (google.com: domain of johannesmaisch95@gmail.com designates
 2a00:1450:4864:20::332 as permitted sender) smtp.mailfrom=johannesmaisch95@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

Hello,
thanks for your assistance. However, we can't boot freertos at the=20
moment. I adapted the linker script like this and rebuilt the freertos-demo=
:

ENTRY(vectors)

SECTIONS {
 =C2=A0=C2=A0=C2=A0 /* jailhouse arm inmates have to start at address zero =
*/
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 . =3D 0x48000000;
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .boot=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : { *(.boot) }

 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 . =3D ALIGN(4096);
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 . =3D . + 0x1000;
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 stack_top =3D .;
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 . =3D . + 0x1000;
 =C2=A0=C2=A0=C2=A0 irq_stack_top =3D .;
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bss_start =3D .;
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .bss=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : {
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 *(.bss)
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 *(COMMON)
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }

after that i tried to boot freertos in u-boot with the following commands:

=3D> load mmc 0:1 0x48000000 freertos-demo.bin
reading freertos-demo.bin
198508 bytes read in 45 ms (4.2 MiB/s)
=3D> go 0x48000000

But the Freertos-demo still doesn't work. Is there anything else we have=20
to do?

Johannes


Am 04.06.2019 um 12:27 schrieb Dr. Johann Pfefferl:
> Hello,
>
> the start address can be adapted in the linker script file
> "lscript.lds".
>
> The UART is initialized completely by FreeRTOS itself including the
> clock gating (hopefully).
>
> Hans
>
> Jan Kiszka <jan.kiszka@siemens.com> wrote:
>> On 04.06.19 11:09, johannesmaisch95@gmail.com wrote:
>>> Hello,
>>>
>>> we want to do a comparison of running FreeRTOS on the Banana Pi with Ja=
ilhouse and running FreeRTOS bare-metal on the Banana Pi for a study-projec=
t at Hochschule Esslingen. We were successfull in doing this with the Jailh=
ouse hypervisor, but we currently didn't find a way to boot FreeRTOS bare-m=
etal on the banana pi. So our question is, if there's a way to boot the fre=
ertos-demo.bin from the freertos-cell bare-metal on the banana pi.
>>>
>> Conceptually, you need to make the demo executable at a different physic=
al
>> address (it's configured to run from address 0, but RAM starts at 0x4000=
0000
>> on the board), and then you could load it there via u-boot and jump to i=
t.
>> You also have to ensure that the demo configures its uart itself and doe=
sn't
>> rely on the root cell to do anything. I don't recall if that is already =
the
>> case. Hans may tell more about that.
>>
>> Jan
>>
>> --=20
>> Siemens AG, Corporate Technology, CT RDA IOT SES-DE
>> Corporate Competence Center Embedded Linux


--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/9d12161b-a004-ad5e-0dfe-1b1c249358cb%40gmail.com.
For more options, visit https://groups.google.com/d/optout.
