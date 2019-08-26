Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBYHLRXVQKGQEGEGMUTI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x539.google.com (mail-ed1-x539.google.com [IPv6:2a00:1450:4864:20::539])
	by mail.lfdr.de (Postfix) with ESMTPS id 409E79C8E9
	for <lists+jailhouse-dev@lfdr.de>; Mon, 26 Aug 2019 08:02:09 +0200 (CEST)
Received: by mail-ed1-x539.google.com with SMTP id w15sf8941049edv.17
        for <lists+jailhouse-dev@lfdr.de>; Sun, 25 Aug 2019 23:02:09 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1566799329; cv=pass;
        d=google.com; s=arc-20160816;
        b=Y0YNF8iiPtCxelxyeRztXslL9nfWOhKPOIBUF9dA+c1lIhc0xSDsrOkFMFBCN8vzdJ
         MigMV99VwYnHq6AjCOeMJ93wUhHP0cWOyktPWBacigZu3unesTX1RWc0jSFati1QikVr
         KJLv0GpNyt8QMhRbpHkvWhDsPegJ4+XZdxD7jrT2WsPzdIJkQlsuUQ7C6h3wTLyzc0hI
         BQBp62ianwk5DWI21zOrfEBI51DVPGA0RV31w+im+ZWpDrihDEYjoL0YE3U5DyqCf7dc
         B7YC69/1cQ2UmDmDLSdrhv74HrsFddzKynP9p/EOxvIs24vrLjUOV5wSk3ksdM/kf1Rl
         rVXw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=usjXV+PzM9Z+QdE+8hhorUSkFP+zDLh/rkam+WB5o+I=;
        b=dWSi1nJzs7uQL0U097TqbOQCXXbNXgXsTiayr/9DoLdNI/zuNc+M5PvZWW5ORalmKX
         1eNIfnkLA1mLlgrnE099hTIIo7lWjIEz9+7NTdioLTovNgkkoV6rsOYUBn+Id749tC9j
         UCuV1c/6O5CJy1felv1ZhZGudeATr4gp/Th/BWbob42wnGP8rz6Uqw8+zvpJzt/FyIYM
         LjNSbFLnCLBRDYJCe7Jq5OgToy+IeV+Vi2pmzRSrVJNWhQN2vg+4kADucfTygVLYQKVs
         cGgFk+59DXIpPPMxLEu2m5tRVKO4Eq9vHGaUkoD39teW9sX8yKQwcqwGYf+cCvv4uj1g
         ryOQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=HsGJjPYe;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=usjXV+PzM9Z+QdE+8hhorUSkFP+zDLh/rkam+WB5o+I=;
        b=EiCmtdtEKKdkXc8/u3DIxOrsxP54PZXvI2x5dBhec/4mZXl2fhGwcpPRoCuebUNpiX
         fWSwg6uUX16LZkB0OSIfLFWZRzBbMiSoDRptgI5QEkf8XF+I8LpkuJfOqP7eFfCd5un3
         A5dz+IGfZasUoY9JXVNgF/tO17P6UD9khTfGNXjm3au21y+MvCk2UuyP0A4FOJVxl+UE
         i3kljr0sabxrzckrf2V5hg+Te3SAbk+DZskadlwF9v7FaBQaNycJTFNa2r9oQJgqDggM
         IOYJMnQ8uPJEuM5bj2N754mg2V/M7E0SWf0aMAo8Qjh+/defICHYePFbWd/mLFwGw9U2
         P2tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=usjXV+PzM9Z+QdE+8hhorUSkFP+zDLh/rkam+WB5o+I=;
        b=VmPGQ1kCH/vWIfCvscjDuwMjUK5MOjzLAAo+fClQt76MwwI/ZkwM6z7KetPxqBisgh
         oLSFYE7TPyVaCGdDmhWk+MQXriDUys+uWNvjqSNChcox7vQ8p9Q5uHwqcY+JPSQ/n4sZ
         AXHGX+z6ICRqNrzkMyX9bQI0DDSZu5QhUiwEJOd2YoQX3tY/4l+XB750P0Aqhrp7vI9n
         +IOOqTos1aByS2o0uonfIJf2u3sgpF/h1fiIulE+dw/fz0z1+hUQZH3b27SGD8oSb6OA
         ESjsyDfsC8Iyj7lvSutk05FFB6R5am4nhJeo7fmFQRKLS6iTvPn8QzwzKBGvqtC1Wzep
         1Fcg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUESXDzkh9xQyRuSHa5J1laHwCXIpptzFRz/xo6KD6IEfOj0zMR
	p7pvHB6APcVQgo/xHSJQfpQ=
X-Google-Smtp-Source: APXvYqwOc8jTN1DMCPxhiEDiO4G+oXz2wNFMvIjGRNND7jVyEf6zjTrdOdUIuJXk6xi7o0N/N4Cnrw==
X-Received: by 2002:a50:8981:: with SMTP id g1mr17163956edg.53.1566799328941;
        Sun, 25 Aug 2019 23:02:08 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:ee99:: with SMTP id f25ls5653810edr.9.gmail; Sun, 25 Aug
 2019 23:02:08 -0700 (PDT)
X-Received: by 2002:aa7:d7c4:: with SMTP id e4mr17199551eds.240.1566799328445;
        Sun, 25 Aug 2019 23:02:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566799328; cv=none;
        d=google.com; s=arc-20160816;
        b=FxSjHsZuf/kTqrUrTn+cGg+mHEMBvy9dX5IfDcXuc5Km1PUxfzxeAR14v+P/i/oF5u
         6ZPXfZO5tCxr5sC83kSi3DnHyUABqgb1ZPwr3MvvexIh3HTAHeP5aIqWwZ4YxJ6LnuLO
         VFZZpEgyISjewYN9tFfUpECOPV68X8V+nfHq26nh0frqEQqoawaDTdpfv0NJBRbJ0CY4
         98gGsRBsvxVa5t3PMZSSUv9BGSYSzamjapzcZFPzaGo5tWgAqS0/9hfBajJOp/tEINA0
         xOUEnahlaqDhJnKTmjKVEVt6gKIWzMNBAd+Ea4LLx14MY5qpWVAEzGgaZwXO5vePZ4W6
         LEBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=ppaR0jc3I/wPHnROwAKdycJlxPj3xY8ZvwggJtX6beM=;
        b=Zxjw30Zoa4KWQEu9HH089nsRgzi24hLErj6rBcCE9GkVFf2xXkWdIBpHXn9Vgpw1Li
         TZWcB+xWQ1UmVZWkBuneLmuI6Jr/5Plu2Y/hofC7S9RrP8wGepqgthgu4MbtWwVUrLNj
         Y+XoOCPyo/F1guFzxMb9nzEIJhdz2V+4vdIM61/LnKUHHBMuoRW4GXetmz7KtTOKZSsl
         ueGpwcQChQdbpKnpg9brV7fBp/flI65fecYPpnFQ+uzW7GOiotzb/ewyIm/q+c9GPrRN
         AzlAF7CR5l4gghxthR9Hc3X7Wv5DmJM4dPLHvKAbAtvQ0fwjK9y7JrV15OgeBY8aYZ8z
         Efhg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=HsGJjPYe;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [217.72.192.78])
        by gmr-mx.google.com with ESMTPS id m29si627604edb.3.2019.08.25.23.02.08
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 25 Aug 2019 23:02:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) client-ip=217.72.192.78;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.55.156]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0Ma2U7-1hmwRE1CPP-00Lkuh; Mon, 26
 Aug 2019 08:02:07 +0200
Subject: Re: Colored Linux as inmate
To: =?UTF-8?Q?Jo=c3=a3o_Reis?= <jpagsreis@gmail.com>,
 Jailhouse <jailhouse-dev@googlegroups.com>
References: <885a6592-84d9-43f4-a037-10ce73f968ab@googlegroups.com>
 <43d8fdde-153f-40ec-8974-4388efab8315@googlegroups.com>
 <c30da773-76bd-3691-3828-e8f7ed592d52@siemens.com>
 <12a82b12-b9bd-4258-87fb-9525f4bb648a@googlegroups.com>
 <5fe86ed7-e82f-3fef-6eef-a888e4ef6be7@siemens.com>
 <1ebfd29b-3c2d-490d-bd2d-c7cbdad1507c@googlegroups.com>
 <164159e0-478e-c5e9-fc8a-e0c0cb27da7a@siemens.com>
 <f1de42fc-bae2-4962-ace6-a38e99a441d4@googlegroups.com>
 <dd33650a-c068-52ca-4da7-4537de652bfa@siemens.com>
 <82a56f53-a498-4a27-8458-250d9a7e7078@googlegroups.com>
 <211c06d2-9f92-cbd1-8215-12c577eefa62@siemens.com>
 <2add490d-0d13-44f6-9873-d7fcbf1c4141@googlegroups.com>
 <2dc2470b-9494-4f43-a582-06c2558fa985@googlegroups.com>
 <df7be3b4-a447-0ff1-f43b-ee37bf6513bb@web.de>
 <c183c116-5942-4d08-a0a7-a897e8fbed20@googlegroups.com>
 <6dfd2128-011a-420f-860f-4ccb472c079f@googlegroups.com>
 <67cdfa4b-86e9-496a-3878-b5a0016b75c0@siemens.com>
 <521c355a-eacc-434e-b50d-dd7c797be08a@googlegroups.com>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <4fe67562-ffb1-a306-542e-c27b0450bca1@web.de>
Date: Mon, 26 Aug 2019 08:02:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <521c355a-eacc-434e-b50d-dd7c797be08a@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:EQIQ+0svR/mdS9Y5dPGzAMwe3kwwaHRw+b5c0XSOPWQUDH9kly3
 aT1+cXXQ8YgDEofOZ+AbYOM2xvfbxfRqUzdMieCQFiLFjYYdW/fpoHPKXIak0XOCXdFnJY4
 eofg/hNtll2bNOqrNKr1dRqr3CR33EMZ5oMoRhNBVOfakGqn1rbtA/E1zVCAVcfRMtnqKyp
 qF9X+YSW6MUF6z8SDKA9w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:v9b3Pt/RfXA=:SBQS9pT74ZZbjsyYi/o/OY
 8nx8A7CRnTSDjPVv9lpnr1yCQn0XKjzuCL7yOUS8ik/EpmwkULky0BYiYp/BrfZJR8vYeJSL+
 ana5oUxnWzRYP4X9iDLrivbJ63ELH+T0cU3nHjiguCV6cm4T4OiH0e1bMUvDhVMlURIust8GD
 HybEPFcN9t/1iA7DC3HPgF5yisMJuLS+2Z9P5rKHQJNk7ZI8sLYCS0KRM7Nxi3k3K9tljF7Oi
 6jXV0+aNf4sy7AnNuqH3TIedVMqT3HFmF6NO8romq0vgA1Q2EojHhmyNvuc5uEeUt+7EH41P3
 pYtEZrLpK1DYpijbKKya3YJTIjk816RLrquBxYVrhkVsvCViOnW7crYz+FJF4h/jWytjhZUAj
 YX+lEHBhXAWVgrqGjchJe7qgXcgWPyfhOOrP47ZwDs9sRtw8YxaSS0i7nbwcTK+HZ4b+fY4cM
 pq1hhHi2XYFSDWEwZonqKmco8x/P9bR8wZFJCTM4CWkgqSege+tkOzBYMTF164EfEIQ68+mkp
 sTA6EPHzsCgnnBitJHCVGKKw1tZsYi+uTOK6CGpun8ybarzjQLAdJ/Mr/jfgqEBw3lfI+dRcH
 j1y1zKrGyOXkgNpkSjOB1VTluE9U7b+xiAbl/3zm9pTyA59nvZbpI+c9/kXeriD6bPrJ7PZB+
 8YCjGdQWuggFEUHD/ehUMmV5B6darJBWMimGXtyi5vUl/zvhjiG/h6Irv2GSKg903NgeCY10m
 5tuLCL5CfHR337rpzXX/lNR6ljTgl1zmtUNqBOPWuYH58nC3HQLFtqJ9RsBI1fboPbOu9eVzo
 eK2dbZRGiz0beg9XAMStu5GukC48WlPQ3q6qTXs9FP59SYVoJO3z8vVRON6kUBECfJdMj/qm5
 UrEKMoCtC8/zdRG0zUe1AzxJJRmKWEdHlBeHnaGCwHcGR9e1QjRIUsdaHvO4VL+l365NTjz2P
 4SZlvBUpYAgIWvTL2Acrk+G+5cXl340UFQbw7DkHDKt4a9a7BzKoUdPzPiQgdGcg+71Tj0o+3
 GVc24Nr/WLUmZ3W5iZheuUJ/JIOQCVwMYq2KVXTeScflXid0sDJD8phuwLfWLeJFIeIwn+Ty/
 SPWIfWOA4nUlbeF/VBNLoCMxbquY8VXRYpjDd34A/iMyxmLeqW4Ueq2vbN455k1y9XeVJVj9O
 wMUWk=
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=HsGJjPYe;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as
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

On 26.08.19 04:39, Jo=C3=A3o Reis wrote:
> After adding the driver and starting the non-root Linux, i can see in con=
sole
> the link between root and non-root being established.
> "Adding virtual PCI device 00:01.0 to cell "linux-non-root
>  =C2=A0 Shared memory connection established: "linux-non-root" <--> "root=
"".
>
> I can see the interrupt of ivshmem-net in /proc/interrupts and when i iss=
ue
> "lspci" i can see the pci device listed with ivshmem-net driver attached =
to it.
> But, when i issue "ifconfig" i don't find any interface besides loopback =
and my
> pc's interface, supposedly i would have to see linux non-root interface. =
Is
> there something missing (some driver maybe)?
>

ifconfig <ethX> up? If the driver is attached, the interface must exist.
ifconfig -a will tell you the name.

Jan

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/4fe67562-ffb1-a306-542e-c27b0450bca1%40web.de.
