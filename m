Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBQE677TQKGQEPW4ACGQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23f.google.com (mail-lj1-x23f.google.com [IPv6:2a00:1450:4864:20::23f])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ABC23D18C
	for <lists+jailhouse-dev@lfdr.de>; Tue, 11 Jun 2019 17:56:49 +0200 (CEST)
Received: by mail-lj1-x23f.google.com with SMTP id e16sf1306948lja.23
        for <lists+jailhouse-dev@lfdr.de>; Tue, 11 Jun 2019 08:56:49 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560268608; cv=pass;
        d=google.com; s=arc-20160816;
        b=IiGSko1/IlvxBzBD8LqurnReWwatWIq3cC4TWKUYLavW5Dx+sdQW0qtTFP2t8YEnkx
         ZpFFbsYqeakxoZixzw8PBI9+7XutH7h3zUOoFDqLsmtCnuycJg15+8JixYjRgqbbbcpm
         Bn7ElIqzxhyFV3z1TU89ZCMKNzuEWii7XTFSmBWkm2QAsf1tJE+gZUjKSASJcU/uHomZ
         0Z1G7Ort4UrN0W1KlZ9ilqo8LaALKJSK4eP/fpehOoOkG/xxKwePBUqqo5TmPNBJAr4j
         vzi21WVpxLH15uAhzKw79EFkN/8pTXDtg7Ea5+VtReY1D/HPK13/A0JRsR2oOJr4KT4x
         siug==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=TD2RAhj3jWN6AnOMGmtv/TiM9Ap1XWucfJ2N3K43TlA=;
        b=tPKnuSu2FGTNoktpCZW0eIT9+YRn3oV4UtYii0w3kHToijWft6w9WHL3mGiQSNRlaX
         g4TFNMgixUQ9LL0JeEkGKmvgEArOvdSjKbHqomrhkP00ivtBGzUEBjvLbqn7l3bkP3NC
         j/IgYTpsGrVZXJtTsM7qBsfr3Kp1GLwj/3NcVQJy9diNY+9RxJI1t3e0T+PROUcucmug
         p+hyKfD64umUM6FUZekmH5zDZ0Qlpg5vbQQBPTSjsANoy0waMnc5NTO3ckNPkxrJR2Ss
         Dos8n/n35CZATp/UhOMYpAjZN3n0Isf0IMp8B/Gyt1nj0L5foupvvvrE9uyZqVijigvc
         m3ZA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=kLigYl+T;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=TD2RAhj3jWN6AnOMGmtv/TiM9Ap1XWucfJ2N3K43TlA=;
        b=kUWl8iN4lKnrl+SiM6VUeltz3RKEfBB4NBhhpFg6bNtAheo/KFkAe6JsM97KnMG3Jk
         khIoakQh+KVdmoNTBCuPBkL8XvgFFgva6eiuYzhn560SR6b1eO9virR9MnAIRkUl1jrx
         DOmboylNNbl7+1ZyY/t+m6ZJ1qMN7kElETMVoPELne7Taci3f6CX98GGGIrrGBjzhEg9
         l5mKqQ15u3YxKEV/imddINHXgtDa/IEzSXrTK8qSv2yR6keYigcJgNZMX5tdsXEkMYxV
         VxDp5IrNAvcdCJJxL3KluKvVVWQ6r3+eMBD/VfDAn8rMbtfBzU7oWSusK7Gf5Ep3Oi0Q
         4x4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=TD2RAhj3jWN6AnOMGmtv/TiM9Ap1XWucfJ2N3K43TlA=;
        b=AiiZ0yTPZHIcsSwcvrFB+Gr/n2Pa4mwbInlWzdDZbfTPmr4A0tVT7LkpSCM9kvLSg8
         YpsJxwgmXyOphOPKIgKd8dyGaSXdyuHBj4Dskt+BQOnJ+J5CatH2vGKDkJAwEmrTz7/6
         hCGv7O17wFwbYJ7wuUuWCofW1AlDuGPyXxK9+6k/mwxQPKC01TEiyQNYjb8JxFXPdXBn
         75iP0EwkCMreqzR97Ta6ETkqyvRt9ZmYP6ThcVoBOLvFzAvOUbxOxzdWRhyrngT8e/L2
         Qmk8gPKBdV/XVrLP4iVktG5okhuJxQ57S9OhruLsOeI9oVW9tG4cG5usqUdm85sC8UdY
         LWYg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXMcpDbxHiL1GLev2s2L0YocjcrZ48a+TxEVgF1snVn6l16P1ma
	cMQtoNsSPBpxTU9N+c8FgYc=
X-Google-Smtp-Source: APXvYqxs/MjoYCaA+0D6/uc0Iox/9Q22gslYwqcY28nHqOPDA+n70DhrO8uSc74tTyyVzn8NTnodGA==
X-Received: by 2002:ac2:48a5:: with SMTP id u5mr32119246lfg.62.1560268608869;
        Tue, 11 Jun 2019 08:56:48 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:2f04:: with SMTP id v4ls2242496ljv.1.gmail; Tue, 11 Jun
 2019 08:56:48 -0700 (PDT)
X-Received: by 2002:a2e:5d46:: with SMTP id r67mr11782714ljb.187.1560268608246;
        Tue, 11 Jun 2019 08:56:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560268608; cv=none;
        d=google.com; s=arc-20160816;
        b=EKnhP5c6yoc1SJVNRDnc/x57Gus0y4odCF2T0rnjwD9KirUG2Ab0qfkcdU+633uJ+B
         ebmHPr0h/7Jp0QwNbm+0WC0MvwKxWpzKOaRhFcXgaUjTl2iu/X6HbSXV5qEmSmvo+WPf
         SHhlhMKCy1fibIHgkISisxYNs6R/Lrq9RYEz+edv+M727jBK4i6vBUwUanLsRLfy/Hh8
         1BBH6EU0BEzXftMueWv68QendiQdpmQmsWkKmLqxTnhnaNQNP5EVZqwEtjHSBDJd7YCM
         xVtP/SavQgwKRAs3keKJpEJuiqQ6m0S7CaaXa2PHxFP4N17qI39XEWSLfarp+TU3on9E
         csaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=eYZZa3XZCF1ixbtT7pFKU5zBI/BCwIRqg0AP1a2vARU=;
        b=uWHraRHFT5fJ0aLWd7nYXgbQ43MvCegV4iYg54wjbzBoN3+LdeevOwkLP4c7TS31BC
         YnbCAUTABHBjmw4idGmJlqIU3Emfjv93m/9139DpX95bfwOLoQO7NEPWwbGTlaFcNsaM
         jlVHULPsyLdfpUS/2aHEFbDBQvU0xL35PayqhZju48+klSrr4bqVWE2AX6RgIGpWjgqJ
         k/AQXtVbO8YR1xmSExiAjVDq949PBlG1dos/DORCUMmJRnSDhb0gGQ/4776y9LQ/+6V2
         KNOH+p66LrWZ0+//TEVOWhpVZKKOu66KLxQ9oe/vCaB7+wZLJauVF0lKchuKiD9Q1EaG
         XHVg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=kLigYl+T;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.17.12])
        by gmr-mx.google.com with ESMTPS id h11si273001lja.0.2019.06.11.08.56.48
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Jun 2019 08:56:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) client-ip=212.227.17.12;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.43.205] ([109.41.67.205]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MC1nQ-1hRxhH0dQu-008qLS; Tue, 11
 Jun 2019 17:56:47 +0200
Subject: Re: [PATCH v3 09/10] inmates: introduce test.h and test.c
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
 jailhouse-dev@googlegroups.com
References: <20190610230330.21419-1-ralf.ramsauer@oth-regensburg.de>
 <20190610230330.21419-10-ralf.ramsauer@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <50bfa063-2952-601f-f873-e1fe28185c4d@web.de>
Date: Tue, 11 Jun 2019 17:56:45 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <20190610230330.21419-10-ralf.ramsauer@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Provags-ID: V03:K1:+mmNDjje4493Q7uq/sqxUPWGz70utqW1mx78mbbZUUGzJk6dfPE
 zO2Ef/clPaOwGdPjcwm+MYHuZgHHt4rHakzx3cEue3ri9CbumBwAND7Qw7lID+np+WoiGpu
 XhYrVunMvrnKupxB2m77xZJAdwUGNqhtr9i+4KkkJ6DoSUsa0rFzxCCC+PC9WO7nMBCoNO0
 15XJm91YYPKdkmZCTdIcQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:cCcDEqPVvRk=:Bp3PtmwKsa1xvbKcSfRbEk
 QvTMPMxWv1TIZ5ZpPNivq8zH5eG1A6SlQqV4Y2G18h8ZeVPpoLeCkmjiU4RdExjf4HkmnWOHI
 AlWhzjroGsb3dhfcww+KGPPd0+5xkbQitdOsQaKncKq1S7c0ckOtENy9+8jrt8cw+CtQYQlD5
 mvJznuqCUvmnEdDwPL0G+An7MWhLygT69sBAAUyNZRTuqkjXLZtHqVfIZ9oSN53JiJcmTJzES
 ATAP59kEYXHtrnSNEc8A6r6jPAiUWOCxz0deJk+Uvo4IimEwHjkLlM256AqfenzZblydg0ISF
 O95ycCzxF+WAW8lWDz5ehM0Iy+u1RaJIh9YvcFyR5sOwksxYYNWdZUczrsr94xKuMctUAf9cz
 bK9O3MRkZTzBNsh/w8ndtjif174Oqz18J9ixMKaiZxMRnJc8nofai3Baqv2Kmj+jE+yjMYtT6
 1D9EfdHANB4OmpGfb6TQjPyquroMW6j6yrsdRTb8hOrkWy4TPxHW+b0cC7JFDHxTYkYRMcEIB
 iHDf52RZVmgAn6zZ+5jHEFksHcuNAmAbZT87NcoTrhZhKkcUec4PAl6YdNDix5n81m9d2g71E
 d5u4h0Cr0+7iJR45uWoAh65j5AYb3Ok1fG+4pmu8M70bqWsHnjIu3/xgsxHXiiXGsBkYI/V1x
 Gu0bTXxGxmR0nuHDilrSTk2eBEpwxzsjZB+VkRtLIjyJt9Pqn7H+j28lNVHfZDD5Er545RJ03
 RohvvPgZRbkTXE+57nv3N/zda7B2FlcIwDLodA3f6hWp3EumUmSY672KSF6DW1Eq+30sg84Nn
 Y5n1FlZkjxwS3rgKEDZsNBgAK3CKTftwEDRR7kucJNlK2N4AA+Uj9lVtNqw5eUfwL4BEr/imS
 HsGfp65KQ17X9LTv71CE5xktVu6OFOZeHLKWh6KXAz9Ffivt7OxthKfeGxr+K2uEKI5iVZCB7
 3D/2nRKXuUOlLxTAbQUscb7MT450vc8hequSayOkSF3fB35f9t/Ju
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=kLigYl+T;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as
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

On 11.06.19 01:03, Ralf Ramsauer wrote:
> MMIO access tests use the same test pattern. Let's share the code.
> Later, we will also reuse it for other tests.
>
> Instead of EXPECT_EQUAL, provide macros that differ between the actual
> type (u8, u16, u32, u64). We can still use the same evaluation function
> if we first narrow down types, and later expand them again.

I don't get the pattern yet: You introduce new macros that type-cast to the size
we want to compare. Still, quite a few call-sites carry their own casts.

Let's split this up: Part one is the factoring out, part two the type changes.

Jan

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/50bfa063-2952-601f-f873-e1fe28185c4d%40web.de.
For more options, visit https://groups.google.com/d/optout.
