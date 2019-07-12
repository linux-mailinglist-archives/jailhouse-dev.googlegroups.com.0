Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBLG4UPUQKGQEKRSOV7I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53b.google.com (mail-ed1-x53b.google.com [IPv6:2a00:1450:4864:20::53b])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA8A675ED
	for <lists+jailhouse-dev@lfdr.de>; Fri, 12 Jul 2019 22:31:41 +0200 (CEST)
Received: by mail-ed1-x53b.google.com with SMTP id n3sf8810420edr.8
        for <lists+jailhouse-dev@lfdr.de>; Fri, 12 Jul 2019 13:31:41 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1562963501; cv=pass;
        d=google.com; s=arc-20160816;
        b=jnjopUrgBAiARRVuaHknxq4/IPR4sOlAr+eh7kPJNoPGV11K1jvr2Wc+yxwxjrb9We
         l2LqzAEfabwzLY4bGxfFnbhX+FxFODwG2n2xCkiR9IRf03ntqGYlQs4kvlg4ohHHm0PV
         Xmwu31qxNfsdGarYjdEGN8BF6XmDSaGr5kn46n5JhEiAXaE+o93PvcWsN003JZKHMKMV
         N893qkrxiWNj5ip1hlVD4dLOQ0358rrZD8a575tc9d3uQB/tiVYSYhIkJimQHvHlDfw0
         bL5t/GE2RON8aKW0zWFY/PbZ06Pa/s7dNZPWn4OXYcZY/K/2lMbGMBVasyWcx95laBB7
         ap5w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=pVHmbVq+ZB++530k1bpAF3c3SvOpOQxMDdGnuHjC0/w=;
        b=bNQAZ1aJ+bexvoM9nTfUuUi5TSFd9mvlsAEfXWzsi3airR5DlBhOCUSQ9mRA6ySe/I
         8yzFBV4fu2XjDc/rZOu9EedlszWR9YdXDJh/GPThv8WVG/G+9x3zhmZFamc1naqRMsiY
         hr8KSfhryliPax8qHAPz+uQOnD4wug7/o95Q2pa4Xp/51R1NpcQinTpXKo31zIEQ0QsV
         tP1MWPy3TDgBDSvLf+lG99MkrPa6K9+wLKzz1zTt/ARMYWkGuHTW4Q29NxD8dOONWS8W
         296/NsE9uP3+BfTcBgdJBQOrO3y/cglcIWsjOmYZ18q0+e2XdeuoxQs9BzNz9ZV5kAG/
         ZQvg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=aPgN2aFw;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=pVHmbVq+ZB++530k1bpAF3c3SvOpOQxMDdGnuHjC0/w=;
        b=AUqDEsuPjvQ0p5pFICj1YCUOmhAi2EeFbWKWlHPG2ktlHOoTih/KHwdcWV3nGO40uD
         V49MWLqTPkLkZmDrSdQnpMckiD62wKactdQ0PBgePRhiMZNpeCQiVppf0rCk/EkeA2OW
         jLRU6nP8KLibCn97+9mzyZQHdNbWu0Nqap7kmRAHIJoHqZEVZeCVoKcy1xQaJY/Zjp2m
         ZbUEejOKDUStHwQArXKfImMVF6iCKz+tp4afop4MPaSzv9UgAFRTIrzhgF3sUH0EjJPV
         1ZOwUXqHCVwHQubaGFMz64GI1M+gT4Y9WsTnGYrS/8uAoZOFpO5QLgLd7taIIzVp4LTg
         fT8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=pVHmbVq+ZB++530k1bpAF3c3SvOpOQxMDdGnuHjC0/w=;
        b=WiZHmupYDLC0xnl1J1QM6yWY3riWgBA8/0N6F4TKk1YOkC/a0r9Yh+AD3kBfk7SScu
         cT+oebMTQv1KQNSEVQISS+On+75agtbgb6omuz3zT82hLJo3pcuYDNA9kwkbbG1x0eEv
         aCYyvx3oNuH6PMZn4Rco6Nc8FtaWcknFxObKzFTCQb6L9Fd8yHTKXUp8ou244c/wcuNt
         ki4jacP+OxUDfVF9Qb8APrOgyEIR4Ni+lvTCqkIApw7V0rHzDWFqFuNDZ2bbUTMhnJJq
         ++YK+L8Mod4+IX0iu0TjGbXPoZdCuZiNXkfFtbyebncnd5EGzapcTnqO78M6qa/OtcTp
         ulGw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXcg64HbeyshkhVZ4S5vqkaXVGDrc6zg0FRH6yQR3seaWzWeEbY
	s8RWH9hReQ/B/UUgElICO5o=
X-Google-Smtp-Source: APXvYqx7vAYKywE4lzwSQDBmqLGUTTvAJ4pZkLksC88oTVGlQDEnQ6/aXjZfELXrFJU45lBwfBAQxg==
X-Received: by 2002:a50:b388:: with SMTP id s8mr11201269edd.15.1562963501246;
        Fri, 12 Jul 2019 13:31:41 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:7a05:: with SMTP id d5ls2304972ejo.13.gmail; Fri, 12
 Jul 2019 13:31:40 -0700 (PDT)
X-Received: by 2002:a17:906:ccc7:: with SMTP id ot7mr10045230ejb.198.1562963500651;
        Fri, 12 Jul 2019 13:31:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562963500; cv=none;
        d=google.com; s=arc-20160816;
        b=dzHy5yiMo5kLhV+9JCRUZbgAFl8ldkN3i078NUxSQkC4wrrh7rvDCl66wqaxUnHXjB
         xCU3dpJ6CA6WphqI8pL8QH9cWGfMYQWHpL1MShADv4xSMjJXO06dbgKvs3mu4RwP2Qu2
         1P9K9U6K5gYsKDZr5F9QfXwyHfudpZ4+SARSRUt35MCK+93qvlxV4aI16b3k0HtjcwX8
         cveVrk2hzCDcq9s+yKyVvKcGuz2kirEeQJrDhtbGVErxySKNbmtE+YuCi6yMnCF3T2sF
         ZbhfV5YI/qim8FlVXdPQmE3zZYtbQ/63TLzOTcXZHHvhn5hBfVs4wxNqFRYVkdas7xr0
         hVqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=fMp9HR/lSgp4gdulK2+F0UEDdVRW/TC9ENs4IcLjPVw=;
        b=qGyqp1enqPJNfXuTNYSuw4DzCr7r1N9qShj7lkwRvrsdtiuP7hkfIezXNJEcstp9LC
         1yR3yj9bikLkhD0Q5gHLgfJd2XUUe45d+VAFlwzsqJpVnRo33imFRQvd0g2XTTQlwCA7
         O4GnhgxCzLbkPvqpTMdYlVH+XEvC4sIKzpDop+35vdRAtZkdUHpNGnFpBARbp7Isdo6c
         OjqvpQpFmYcbqibNQyHoI/CiqizxSwib/EgQzQX1YURGHr7X1nbFwPB72lZ79RLp7NUv
         97W+IkBcLVv+vpEzCFRl4IL8sbQzs2xNWc6ESqXXXeS2DUAkWoeCnMAeoVJe4z8Mfxuq
         QZGA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=aPgN2aFw;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.4])
        by gmr-mx.google.com with ESMTPS id s30si683038eda.4.2019.07.12.13.31.40
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 12 Jul 2019 13:31:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) client-ip=212.227.15.4;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.55.156]) by smtp.web.de (mrweb001
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MejSy-1i5m0x1MCW-00OIID; Fri, 12
 Jul 2019 22:31:40 +0200
Subject: Re: [PATCH v2 2/2] pyjailhouse: x86: implement pio_bitmap generator
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
 Andrej Utz <andrej.utz@st.oth-regensburg.de>,
 Jailhouse <jailhouse-dev@googlegroups.com>
References: <20190620220614.23450-1-andrej.utz@st.oth-regensburg.de>
 <20190620220614.23450-2-andrej.utz@st.oth-regensburg.de>
 <e369a4a6-57cf-3fae-a68c-3351394da184@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <97013af8-fec9-f42b-6c40-9712fff0c266@web.de>
Date: Fri, 12 Jul 2019 22:31:38 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <e369a4a6-57cf-3fae-a68c-3351394da184@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Provags-ID: V03:K1:6QrG07GH4QXUy7k75fvCa6my3o4FAvEvmTHTsDEJD4iuZCkKquL
 T1QOasPnm7IrDeBM9+TNhCEenYYY1vRCrrsGlcEaxQrlB39dO11jUci0Tzf7PkbDeIGjz/n
 4SGvpK3A6FU0N94rx3uvI6Ziq48JNHvfEOubAoN2kphw42plchFkJ59lNmzBzuApTbWWN6T
 f4OxJNm7RlO6sjbUB3F1Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:iWGAqdXV8KA=:mkXrTamfXkCVwFGRg0agYj
 fULnP6nZ7XT3Ym8iTw8YctoKl33PQjZDsZO17k/kl2kOZICZJz8JQpGVe0edC+nMfuk0+qw0j
 ufkbLSv5gR2wMRlZ+ih8Q+y02CJe8iRDpsJqXElJvq5w75sdg7xLOLFH0R/HqNWcESKfrVsYO
 lmuu5/LxnGcEfrmWk4+jE9alRa+Rr3w7QTJlH/ip9tmp1fziikmFW/3c1MLWDRq5qmAf7Ez34
 EPxvLE8VONl6O2Xhn1eUL2EkIfNm0Kz4qLbfr3eDInMj1t6xJct11RIZ1b3efso70YIPIKe4z
 uDcnsRiV8thqth2HWjyMWhsSsn0AHriV81QJYoKD8zNy36reYPVRN0cLILFEgLNxeqcgYIRpI
 4y6tkrY1rD9cS7gwen4sf637Iah+jyc5MCF/9/21GyrzYt4ji/izqi+5VqWyXqFQpNv3/OM5u
 99mS2i03QcgB4u+zTbdJu7sxcdmqFuyfN2XONcxjaHALEv7814x7wy+tesmEkFcfSa1ihv9Np
 PSDJGY+WRh8j2Mjg+m1Bbfnkyrtg8frDHhlOREALEwfiTkauaWveWUjrmobCqZR84QLEn8yP0
 AhSndmTNr05MyjMpnOLumu3Ec93QPckoh/OAQr16Y+epd031qVLHS1kat69GJs1xmR54TeyVp
 53lItfjY9Behh7EgBxEkge/F2EE+qM/n0KMKOjfFp+bpnGHK3LdxFRS6HFRIXSHEH8bFCJHM/
 BzQX1nXNKbUeynk6G1btdfPyQ3Xvu8RBF7idayvn7T39jixEY3PX+TYHWTbzYIEuwbr7USmN+
 JeJ5o4ZnQwra8uJ/eH5782+pWE3jujhiuBuO3HjRDkyc17Fej84+rcTNQtkuSaiJyPxBd+oA0
 M2G2fyw33qc5xFXlodCAZJgsjc2tTCfqzi+88/Yx9UrOsHf2ZqA+T3wo1JVbYXxpULkURv/ig
 xmlli4nLYhLkdOvwXwsyDhfafMxGd8OYxL9PNEWJ1RBmcE6mwTN/+DztJB0OcumS94d3nzO4L
 Yv1cQue22eMs1fy0t2VzTNE7cH2gv1DKuiZuPC1NUulfrjYzEnAh7qPVwG4mTJZImP1/xH24c
 y/F/+AJmulkmfjIbQT+DJOuK99K0iY0iN0K
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=aPgN2aFw;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted
 sender) smtp.mailfrom=jan.kiszka@web.de
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

On 12.07.19 17:59, Ralf Ramsauer wrote:
> Hi,
>
> On 6/21/19 12:06 AM, Andrej Utz wrote:
>> This replaces the old static port list with actual port regions from
>> '/proc/ioports'. The static regions from said list are kept and override
>> the data in case of region overlap to retain compability.
>> The generated port list is virtually identicall to the old one but eases
>> manual configuration.
>
> just found a bug in this series. This series creates regions such as:
>
> <snip>
> [  0x80/8 ...   0x87/8] =   -1, /* 0080-0087 : dma page reg */
> [  0x88/8 ...   0x8f/8] =   -1, /* 0088-008f : dma page reg */
> [  0xa0/8 ...   0xa7/8] =   -1, /* 00a0-00a1 : pic2 */
> <snip>
>
> Now we have a hole between [0x90/8 ... 0x1f/8]. A hole means that this
> area will be initialised with zero -> access is permitted.
>
> Root of this bug: In addition known port regions, we must also respect
> unknown port regions and deny access.
>
> @Jan: This brings me to an idea. The TODO says that whitelist-based MSR
> bitmaps are a v1.0 target. I think the PIO bitmap would also benefit if
> it would be whitelist based. Do you agree?

Sure, that is what we tried so far, but not for PCI. And then there is always
the trade-off between locking down the system and running directly into a
violation on first start.

>
> E.g.:
> .pio_bitmap = {
> 	[ 0x3f8/8 ... 0x3ff/8 ] = -1,
> },
>
> would denote that only access to 3f8-3ff is allowed. All other ports are
> denied. Much easier to write and understand.

The bitmap is encoded in machine format. Both Intel and AMD use the inverse
form, don't ask me why.

Of course, inversion in software would be feasible and hopefully limited to
vcpu_cell_init/exit(). Hmm, no, also i8042_access_handler(). The bigger issue
might be the transformation of existing configs.

Jan

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/97013af8-fec9-f42b-6c40-9712fff0c266%40web.de.
For more options, visit https://groups.google.com/d/optout.
