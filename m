Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBG7OYXWQKGQE6KKVWPQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13b.google.com (mail-lf1-x13b.google.com [IPv6:2a00:1450:4864:20::13b])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A562E2E14
	for <lists+jailhouse-dev@lfdr.de>; Thu, 24 Oct 2019 12:04:12 +0200 (CEST)
Received: by mail-lf1-x13b.google.com with SMTP id f3sf5029550lfa.16
        for <lists+jailhouse-dev@lfdr.de>; Thu, 24 Oct 2019 03:04:12 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1571911451; cv=pass;
        d=google.com; s=arc-20160816;
        b=J2a8covyquhYUOs/K3veJfmQpN0Bz1RxXfNFKhUBlft9R7lVagOlB/4PMgpn4YwW0p
         KXAs06gHUtlaMuqWGE6bByPqdQ7fpQjrEUhD5SI4aTANXGi+KkA3W/0zgTPOlqRH1nPN
         gWTJzaMTmJMEvt0xIMV0xM6Un+GfdToff4iuqlEW9+CIlu1RMcjeBuzXZIDEhg+1JJSY
         lfa6+XLChLne0a9xoDV2HDmh4eoaVmVIuH85nzzlCLLvpQjvK2qbr1Cm5joI2IXvuWZy
         b7PkDP2qxswUmvk/0t0yVTXLyb4ryDOu1x38mKjkqlpco1ScOkaFUSCD/IYHJkzwGEwi
         PUmw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=JE6iBliiyVFhkuSU/jSYxT9P/+b8FzYwLrvBV+9vfnM=;
        b=EUgO+erFEyiBtEdQlpXglLgfR+njfXbc1nmsNJiQSw6pahn2yogHnEAsktFiuXjIPV
         DdKPWYnK9h77xDtPEVI/lW8K2Jp5GF7S5SCdPl5NiM7NlfedRodBYrXCEklQbNX94tsv
         1BV1SiAtNLL4D4LFwsC07j642QNt3E1eAfB6S67HRPYZcDUZoAo0TdJFk9o3zEoYz3kT
         BRFAlqeC9YEAzYGNVNLVFK0pKnvSIkrPT6xga7uyL6WJ45XmFfz+CnItrwWD5c5dlPIt
         aZysVzBzQKDWJP+jvcI2g1KXbKaY3IV5A2rCideyPmcgnYAIUHd7jcHHHwonUW3UyUE4
         A74Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=qUXiOMWe;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=JE6iBliiyVFhkuSU/jSYxT9P/+b8FzYwLrvBV+9vfnM=;
        b=LXw0WVDL+y29p+dBGGosBKNi/oGhNpZMULh8t6emzkUidvNPArHm3dp48eVhf2s/Vy
         mbo7JdzrTwDc0ImRceFNC195nn5YH+mWDDmYFOm1IMdHmDFTNAl0GtMeEItrcWEv8PF+
         c6Auv+3lhr54Hm80mERU2QKOLkO5dtcD4v7xmuFZdDuJgkTJDZbfexVz4Pg/c2zp3RC+
         bExHnAAlsVpRZVU0VdV7sNTzBxSrSeSD7h2rdSFlkdXn0V863C2A3iLoRvEq3mrrlVt2
         6z9cCCtXzbkZjFMeoV4uja8dboedgiVnjocobaV7apY7GyEGi5560mjtK4XoRPKGJcnB
         2+EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=JE6iBliiyVFhkuSU/jSYxT9P/+b8FzYwLrvBV+9vfnM=;
        b=eHTIQMuKDQQQt5u8W9eRGGYNtM7se5LNwjHwDps4FCuaWmGtKPNg3yU4mp98nilQt4
         vFYTn9L1Rt8K/p9eb+PtAqT2JJV0Dcg4ZjRK9Z5qtiRLI4MP9yXGp3p2v5aKU8ZXn+wS
         w56VeKHgSoPSoFStCGOEDWZGlwX2YLH+kKtzlCOGPqqHu3ubaPI+j5wxYTtzEjlfNwoi
         rIa77eqdyZPIN5nDdNsW8dbzHZ1EXBHKUO8e7N3VZU7ibuAWpkc37IDvedQVr3+Hxsf5
         rst8i4GN/t37UdS8EyucGgAR4w1IumtXEe3PUI0IHZ27mut4RtLmy3CHu9ACnr6Twp4v
         1t7g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUkesQPYv+PIcIYj9aN3JGoFEJBxFUi0PQEQsr5Xg40OYFMZ4+r
	CVxlrUpsAdlyvoQly2E+z9k=
X-Google-Smtp-Source: APXvYqw9EV/I1hNV4kwQN3pZrI7M8+KoPU3SG37PmbwHaUitq8hUvH7i7EpDFRPtav5XzA+f4wfZEg==
X-Received: by 2002:a2e:9117:: with SMTP id m23mr25618735ljg.82.1571911451774;
        Thu, 24 Oct 2019 03:04:11 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:8806:: with SMTP id x6ls697332ljh.11.gmail; Thu, 24 Oct
 2019 03:04:10 -0700 (PDT)
X-Received: by 2002:a2e:8e35:: with SMTP id r21mr9073240ljk.36.1571911450705;
        Thu, 24 Oct 2019 03:04:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571911450; cv=none;
        d=google.com; s=arc-20160816;
        b=cusaObZO1bWrqI5YG0I6JdNov01p02GyI3D6BXTR3/0o7gsue3r/IgRH5xqoPtSJDi
         VZBKLvN1RcoD62hNYORLmG/YvuDzXaK/Zj65FI3Qa65unMWfI7XVw52WLXma+/i17fyU
         VuVnhlRuJtavq3ewqRoYPI6QhYdoSIS1Y9OxCmKHErsBBeMZNdYqFFGIX2dDSDiEPAIj
         g/rqc9WzVHJOM+aFlJNJzCb5YKbMex+fA8CGEydoH9X3v+SepBOesxGEKJZgK1H3HpqN
         LdeAkL2jvpWmuzEmuIgNrvN5ZSbP3XZbctv35cPIArG8iC3HPMSccdfUkOl0G60Tr31+
         4JIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=YwN8EvIqTlSto6Ne6GcRFTr7FO7jqtDWvJ5krI9YVEY=;
        b=RxyWqzvH9xZGySf9V+vvoAXY1x7fQERh/HjhzTelPitkeK63hhp6aZkHiLfMBQDpcS
         NH86J9+AZAgrM/sJtlTZHEDPddTALFHQtH8tpgI3FaVirPiLgvbGhY8VF8EdrywJ+TnA
         IuDyKTxbnQDf7KMEOdegqIp+RUFvFjIFVRb/Je/BLQhRAMxTs3Q0fTz+mVHnmh41iLqm
         Bza8NgiePl15ZfmgqmqL8gyMlJAkgfarm5JGCRRf9YApPjbgWO9rbpqF46KJ/xmmn0Vy
         jSb997Opfdj/y+8cX8yTeqVbGUP6ENDb3pcGGQuA1ZaEhWw7/J+sA/ra5KA5Q5j2js4D
         1x6g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=qUXiOMWe;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.14])
        by gmr-mx.google.com with ESMTPS id y6si1500866lji.0.2019.10.24.03.04.10
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 24 Oct 2019 03:04:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) client-ip=212.227.15.14;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.178.143] ([188.20.186.1]) by smtp.web.de (mrweb001
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MINMF-1iR9fy1ixT-004FBG; Thu, 24
 Oct 2019 12:04:09 +0200
Subject: Re: kernel build failure
To: Lokesh Vutla <lokeshvutla@ti.com>, Peng Fan <peng.fan@nxp.com>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
References: <AM0PR04MB4481A5E90644042A0E72DBB8886B0@AM0PR04MB4481.eurprd04.prod.outlook.com>
 <5cbb3132-fc13-d4ae-9e44-bf83b6d4f70b@ti.com>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <f7366e52-3978-30e5-7e19-68571f011b27@web.de>
Date: Thu, 24 Oct 2019 12:04:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <5cbb3132-fc13-d4ae-9e44-bf83b6d4f70b@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Provags-ID: V03:K1:BL8EGwUQVV/B3om2MGki4Vgh43NGl0XmitwSW3viinjeK+bKW/H
 O97ro5gN0oEqq4QE5bQyJWKWXjaFn1Ffi3BdhiSHmlvC5pCG65DvFYWPACMYxpxQtDCLh7/
 H6yDcfW1ygLuZPbNUMTUFX4uklV+D25spjcuf6himFmymEglyn9Q/m/tyOdT4ir7Ah2pkFy
 aKGm0raRFeXY7BBqGDazQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:698r+9f15jg=:IKCTj7laPYpkP3BbDsoAsi
 iIDaX7beGxQK8j9xSTF/r+4qqksDMJ6bTWnjbNp7JRFXP/XCHCE4S8UrhjWoC4IauSK9ixEPU
 wy6KSiP0yVYhiNaODtOo0kSchVly5kYGR+Q7LZRvV/etNU7ngwMTmHg6BY4pxP/7TxRBlp40r
 0B/dkPhj5W4E0q72KeMDsrVs49z4eZcAjUXYa3v2P/xpXj3Rhvcnx4/daPM6Y8P3oZg6ZE1ja
 I7YA8Ud6akNOwoV/iqL7dib9aF8aTxFvO4SocAJcvJX3vlB4RNhhMi3NuRK8Ub3V/yUto40KM
 RE486U+LVzybav3wX5TSXXeGZEBQEuH+Q3JFTRkL3HgYFVL3J3OOLwOYBU6AId5xMr66P3jFO
 UOoS7lyhcib3nHiaaD1R8GxH0tgsJH7xzloknr6jFSiUkY6T7L0EXmHpZlnNDG46DYWDNGavk
 QdXtPQ4JySdfESfTCrQzLiV5dOXZoQsD0HYQgg8nxsS746Z3spKEigN7AoQc9/+DATCqQj0RY
 NCEUNnBguHbyz6oFl4S5tjMPVe8jIuyRgbIITKKQQzrftJQ7Kt7KmBnAcVru1Hrd9PUr/ILbv
 Oti05xMsxMuNeDtw8satolGHPojWf1oInPIdL9wMeaQmMYN/SJ/KRtGiFSL+UQJbA0c1xP/KW
 S/ZEFUm60c1IwB1uRdRSvZENDx5Pg6kMd08v2hss3XLBh/P4gu2SlVZDThA6NXzWJqycTU2ys
 bIROSa6R9cAd+fMghKl7ilUcxojfIJlWsefnb1Hc6mFbOxBaFIQIviuDNWCFUwXretN9K8ya7
 f7hj8OwxIHsWv+ON7uYS5LGATMGEqMsYor/mh2vTYbWKY/cZYRcB0AciYr8XnWignQ6MoCim1
 u/lQEYsAA8uXqHb7l0m3meXYo+/jrtitq/KcmDnia0NiFFZmKy2oswnVuP2vFEHfsolSDL4SS
 Oha1Mc9xvrMdDJH23MwxlWqpoRLGA9/3g5vmHb12KhaWQPfQ5jAGl8fRmd6vnx5gNK7JXb+74
 MsXeef3w6yAUrbjN7iljFJq/o6CoWnQhHgZgqowXHhbXWVUVnJSxm5w9lJNEILTMjs6oXqRG2
 RhNSCmLfAHUeOdApIos6kj6ukrYMeuVgbWxLpCBLDD4yd5sU1keJW+A2RVTKX+gz9ymnEIfIZ
 3NbSBGmVgk8WbSrX3rzdK6XQj9RC/4yuS2hvyGyAycSXaB4NqSGxHT9Wd0AsMTZqWu3XrYHEX
 ZIi2Ky9bbgezMT5TAKdT2gjkN9V/m65m+NezjaymAy5rTt5nzGbR1r0FPXV4=
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=qUXiOMWe;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de
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

On 24.10.19 08:07, 'Lokesh Vutla' via Jailhouse wrote:
>
>
> On 23/10/19 3:47 PM, Peng Fan wrote:
>> Hi Jan,
>>
>> When MODVERSIONS and ASM_MODVERSIONS defined, your queue/jailhouse tree will have build failure for ARM64.
>>
>> MODPOST vmlinux.o
>> WARNING: EXPORT symbol "__hyp_stub_vectors" [vmlinux] version generation failed, symbol will not be versioned.
>>   MODINFO modules.builtin.modinfo
>>   LD      .tmp_vmlinux1
>> aarch64-poky-linux-ld: arch/arm64/kernel/hyp-stub.o: relocation R_AARCH64_ABS32 against `__crc___hyp_stub_vectors' can not be used when making a shared object
>
> allmodconfig fails as well without this hack. We are also carrying something
> similar:
>
> http://git.ti.com/cgit/cgit.cgi/ti-linux-kernel/ti-linux-kernel.git/commit/?h=ti-linux-4.19.y&id=6c809904ef4483971166142a12302c8a0522e23f
>

Cannot reproduce quickly with gcc-7 and current queues/jailhouse. Do I
need >=8?

Also, this looks a bi like it's a limitation of upstream /wrt where you
can place your EXPORT_SYMBOL, no?

Jan

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/f7366e52-3978-30e5-7e19-68571f011b27%40web.de.
