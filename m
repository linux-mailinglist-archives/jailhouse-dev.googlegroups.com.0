Return-Path: <jailhouse-dev+bncBCD5HYFFQEERB76RZP2QKGQEU7R45EA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x137.google.com (mail-lf1-x137.google.com [IPv6:2a00:1450:4864:20::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F231C76BF
	for <lists+jailhouse-dev@lfdr.de>; Wed,  6 May 2020 18:42:40 +0200 (CEST)
Received: by mail-lf1-x137.google.com with SMTP id 68sf1039021lfj.9
        for <lists+jailhouse-dev@lfdr.de>; Wed, 06 May 2020 09:42:40 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1588783360; cv=pass;
        d=google.com; s=arc-20160816;
        b=mRGOphqzruu4Gi0S3vjfDFFZ6xPHNSYjBm1VRVXp3/CGKQJeQRFJnNsVihRVAGV/SO
         JJUYbiMPCPuTlHjOTB/HalQO8EuvBTU/7PePWtXUA9rtcbSwipT2nxNnTLCoh5UINORj
         bimAaP+GQDbz0yM+p9U4h5Q+2WJMexgYHSJIZT8vH7pGOqGbJ9ZSPl5xWGfmuqLZ0R/5
         5qDbuC/zhyMPLSrQJ71BWu8SRy48UxWNK5t++8YhJ1ii246Otk6iqgeFO6oRHCK33bBA
         U4eSLz1dqazUg9twPC3yHJ2Ksh+EF9TOiTK0aEm2m0FxWaN9SGCMN2qgLiOALoZWuZ3B
         nz7A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:in-reply-to:mime-version:user-agent
         :date:message-id:autocrypt:from:references:cc:to:subject:sender
         :dkim-signature:dkim-signature;
        bh=Y5nvbKlt1lAuXldJS+43bW4DMSIVwBhcMhX+ibdsMIw=;
        b=LMj8Y/VZR4aFvbvD6N6wRNKbh79Gc+1g0eZiv7ae5SBX5jFf8UsrM9at2d7H2LHlue
         k0m6Xm7wYTyIqcuSToopIh4orzJ6PprOWoxWSrM4epGIwGLGuaWR/fFx20r+FB2jNOIB
         AjewJ9VBDV00R5+nP2oCV7SLlZIWyJgvCVTABOoFZkNrwDr+Uq08pMwr2WGDMjC2MHrc
         nEtTz4CVq6GtrfSRbM9LQ6XfqMxCy4lREQ3vtSpna35dp3KPrF9AlxLqpM86zoRuwglA
         2+iz1tjHdweGN9CY7Wt47WhoIAC5XzM/rrbW2s2zL/NiXQevmfv3GoR3BoHcXYXL7dmN
         hVOQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="F9/gH6i+";
       spf=pass (google.com: domain of lucmiccio@gmail.com designates 2a00:1450:4864:20::341 as permitted sender) smtp.mailfrom=lucmiccio@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Y5nvbKlt1lAuXldJS+43bW4DMSIVwBhcMhX+ibdsMIw=;
        b=F1JENOaVexRFq9bDfBIbeQwjoTykR5QvEplDu5Cdxot0QvlPukI+rnOM8c7XTs3dZy
         /0ZEMNCX2VkXSLc3kMoLQSyInRsPBMWH1nIU6zXe7dkVNrRh/o/hdqK86KB3YwtPMJBY
         bxuptljex3ql2piIb841jaTc/QvihKufN9i1QLL28aK4BgGcqNvY313mFeYYFFbK4iIr
         bTRr9E2OPTZVqP5y7gKqCW8+8Y/pE+MEoyUQ/kfvryNvXIGDmk3OwU3HnnqmZ/vTodN6
         edZgfXIqW1agT0osvlVbtq8JJ8QwSBfis1HfR48ZugAhRFt1P4H39iEIgYFAWbfQfkM5
         rDIw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Y5nvbKlt1lAuXldJS+43bW4DMSIVwBhcMhX+ibdsMIw=;
        b=ZdSJlGa0VwBJ1ySl3l5unWgqqoAs6Z2ZI2GWh7kiE8WcpHuUGCimi498YwrzFT6Ndu
         38SBVikGkD8Fr8D7yAbbx4GUM1ukGX6Ld4lhg3UMRMB8Q6VR4QQehVAIXfZGMBkGzObq
         bKaC/1vShsvFlC47Zcr32xOGuX/+kjGGCtgNrnZiZH1LpYqlWwGiwUD4jjyh9AKSW3py
         8bcOjRC9kCNeccU7nFJr2Cs4guKd3sAqkQwT686sIBQ6ax7l4H8wgvgucvj1Agp6PTqQ
         Rbq1V6zmCpk5QWR4UcoreQ8beucahLLqM/QJv00OCUbaUSaNM5uNCJGdLY6VgjdyYNxT
         JObQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=Y5nvbKlt1lAuXldJS+43bW4DMSIVwBhcMhX+ibdsMIw=;
        b=hRR04BrArNhrkhJH69SuOiVb4cBzAmHg2tfu2W+kN4afSwzHJvIIAHhwoTJhnel6ui
         YvZpj/mMk0WB8DzJ8Wj0liCUUIzE/Ls6EqOiuXXL/14AyB9EE4B3JIin9MyMxhqSXkYm
         5NWbUO0tuRCLxu7FRwfMnXMUATF7lxtIrb+wY64V25d04SAZOA+4oi3tv8sUBnXk9yWW
         iKYJoTGcYSbCkYWGCAp6TyH4VtR1QcGvp5MdM9OvWHw4l8UdM3Jazo2nSVtOCibRcUi7
         pCQXJx8O+Kan2i/4xWwEmn004xTOO99FDs1UhjNSPrsYmd0DXDGvmW2gJBf+d7sQ+Lhu
         fPZg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AGi0PuZtEZutVyWLn/iwqkeYNcpUgQ6LkNTD9XjgKdTcSDyS8g1cwCag
	PaRxJXsY00hmOlzKrHLEzD8=
X-Google-Smtp-Source: APiQypLRqGUHjEtCd1q6nnA59HmsnFw7Zy4Ugj/uJZFZl1IsJWJH0aikm0a7XQd+hpdXcw6nF447tg==
X-Received: by 2002:a19:be52:: with SMTP id o79mr6011464lff.132.1588783359868;
        Wed, 06 May 2020 09:42:39 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:ef06:: with SMTP id n6ls464825lfh.7.gmail; Wed, 06 May
 2020 09:42:39 -0700 (PDT)
X-Received: by 2002:a05:6512:3b2:: with SMTP id v18mr2227213lfp.140.1588783359136;
        Wed, 06 May 2020 09:42:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588783359; cv=none;
        d=google.com; s=arc-20160816;
        b=NwVkeKxa22f5x90ugMpgSiOZbOktj6iTscQhtXRgd88vKFX1vXors8M/uifKzMSdEa
         URbcI+NZBO1OqA3WObDJY9oDhvVezcvoNFzIbC32ppSr9IO3+jL0uNCMROGIp5WTMX71
         ctjp5rK9OlWn6kEo6vrtdx0JONLPpsoA16AFajkPuyJSu8vufZ5kPjyHLbYAouD8izyP
         NPmKVEyNNv9YSzEKRDduTiaXeTljq5DZU1wMO6hLWj6nEPEaleHjk0tERnjU4wPbFoQV
         FeHSKT3DtxYHvs+7lq96BbJSChjmIWtuVS9WZunjjybLP+7TSdqWjHl4/7WCXDvfEGOJ
         3LjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:mime-version:user-agent:date:message-id:autocrypt:from
         :references:cc:to:subject:dkim-signature;
        bh=G4F9YSQQLmQ4fh3NCsOuMdBNIlcxOr6clFx530lDI/o=;
        b=O1Q2LBFCxBE6wWtcaatRmPhks4HExeSb7LC0BowU9Ka/OTsOrpRMWZ8IOgSYEMKktn
         0Bxm7wXI/lFHyaWtG19viCpPYSFSPAQdOshKbVpYTP6EGEaHi1u15EiYwA0mKUssRLAZ
         SvwNaV1P3q6+0qa+yslxh+yuDaB1wO66LC/YvEEMcVhwUL0rLnExUS3stt7GD430MdA4
         AS55OH87J2jjd5Z9IuKZNaZJLJtRbLrC25dEreeb5QXHByMqq7x6OzBmqaunSuMt7nhY
         fiInQ6pT4y1Qc3CvUxDdDFVf90CBiP3+l7lINXja5buxX2YlKJrenUgukwEpKZa41uUL
         mLhg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="F9/gH6i+";
       spf=pass (google.com: domain of lucmiccio@gmail.com designates 2a00:1450:4864:20::341 as permitted sender) smtp.mailfrom=lucmiccio@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com. [2a00:1450:4864:20::341])
        by gmr-mx.google.com with ESMTPS id d19si162770lji.3.2020.05.06.09.42.39
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2020 09:42:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of lucmiccio@gmail.com designates 2a00:1450:4864:20::341 as permitted sender) client-ip=2a00:1450:4864:20::341;
Received: by mail-wm1-x341.google.com with SMTP id x4so3312064wmj.1
        for <jailhouse-dev@googlegroups.com>; Wed, 06 May 2020 09:42:39 -0700 (PDT)
X-Received: by 2002:a1c:23d4:: with SMTP id j203mr5858000wmj.49.1588783358576;
        Wed, 06 May 2020 09:42:38 -0700 (PDT)
Received: from [192.168.1.109] ([2.234.171.104])
        by smtp.gmail.com with ESMTPSA id t71sm4018947wmt.31.2020.05.06.09.42.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2020 09:42:37 -0700 (PDT)
Subject: Re: [PATCH v2 3/9] driver: introduce col_load_address for colored
 binaries loading
To: Jan Kiszka <jan.kiszka@siemens.com>, Marco Solieri <ms@xt3.it>,
 jailhouse-dev@googlegroups.com
Cc: Angelo Ruocco <angelo.ruocco.90@gmail.com>
References: <20190327121849.1882-1-ms@xt3.it>
 <20200421100351.292395-1-ms@xt3.it> <20200421100351.292395-4-ms@xt3.it>
 <c0710d88-a53b-c17e-8c1d-6615b9b8bf09@siemens.com>
From: Luca Miccio <lucmiccio@gmail.com>
Autocrypt: addr=lucmiccio@gmail.com; keydata=
 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
Message-ID: <0af1c1c8-52ee-f822-66e5-c7926fac8596@gmail.com>
Date: Wed, 6 May 2020 18:42:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <c0710d88-a53b-c17e-8c1d-6615b9b8bf09@siemens.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="yr7PvhVWILCNS9DOaWpS634UiktJinw3k"
X-Original-Sender: LucMiccio@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b="F9/gH6i+";       spf=pass
 (google.com: domain of lucmiccio@gmail.com designates 2a00:1450:4864:20::341
 as permitted sender) smtp.mailfrom=lucmiccio@gmail.com;       dmarc=pass
 (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--yr7PvhVWILCNS9DOaWpS634UiktJinw3k
Content-Type: multipart/mixed; boundary="twmeVDn5ZTfoeqaBtEOTXJjRRJFffUHpE"

--twmeVDn5ZTfoeqaBtEOTXJjRRJFffUHpE
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US



On 5/4/20 8:33 PM, Jan Kiszka wrote:
> On 21.04.20 12:03, 'Marco Solieri' via Jailhouse wrote:
>> From: Luca Miccio <lucmiccio@gmail.com>
>>
>> Currently Jailhouse loads inmate's binaries by mapping its memory region
>> to the root cell. When coloring is enabled this operation becomes
>> not trivial. To avoid logic duplication in the driver module,
>> use a special memory space when loading to colored regions. This
>> convenient memory space starts from a fixed address defined by
>> `col_loads_address` and will be mapped by the hypervisor using the same
>> size and coloring configuration as the inmate.
>> Since there could be platforms with different memory space layouts, the
>> choice of `col_loads_address` has to be done accordingly.
>> Allow the user to set this value in the root-cell configuration and set
>> the default to 16 GiB. The latter has been empirically choosen as default
>> value.
> 
> This is better than the hypercall in v1, but I still dislike the
> approach for the complexity growth in the hypervisor.
> 
> I see the point that some logic - namely the strip width calculation -
> would have to be duplicated into the Linux driver, but it feels to me
> that this would be a better alternative overall. Did you think through
> or even try such an approach at all?
> 

Yes. Actually it was our first implementation, the v0 one. Our concern
was (and still is) the duplication of coloring logic between hypervisor
and Linux driver. We put so much time into this problem and we came up
with this solution and we think it seems to be overall the best one. I
also understand and I agree that this solution adds some complexity to
the hypervisor but even if we move some logic to Linux, a part of the
complexity will remain in the hypervisor.
Moreover, moving coloring logic to the driver opens up the problem on
how to copy in "strided" mode based on the coloring configuration. We
did it by copying one page at a time, using the next_colored in the
driver module (duplicating the code) but this approach was too expensive
when loading larger images (e.g, Linux inmate).
One solution that I see is the following:
- during cell load, Jailhouse remaps the inmate memory to root cell as
usual but in colored mode
- the "special" memory region mentioned in the commit is created by
Linux instead of Jailhouse
- the copy is performed virtually sequential

The idea here is to exploit the jailhouse_ioremap function in the driver
module.

With this solution the only complexity that remains in the hypervisor is
the memory management for the root cell that is introduced in patch 5
without the "special" region part.

Thanks,
Luca

> Jan
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/0af1c1c8-52ee-f822-66e5-c7926fac8596%40gmail.com.

--twmeVDn5ZTfoeqaBtEOTXJjRRJFffUHpE--

--yr7PvhVWILCNS9DOaWpS634UiktJinw3k
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE+VQtGnhP9TTQ2NnBI/rjb1Ch6KsFAl6y6PwACgkQI/rjb1Ch
6KvsPw/+NaZL7L8AScmKw2uipe92cvdozhOTn3Q1pPcmY+bhdLAFUf8tww2jm65r
JI/JZLrPAPzgIgFewpB0PUfCy5pzfztE0LsLiEWvk9ouZwfOesIlm6AE2d0tnPZn
PIo/51ZExM2AnYWGhhJ7XJBZYQZO8IeUJnkgCsIQCKagY+zeg8PmEIscJk63OH4z
FjcZQHDomejdb5h7G4K0uAeCvSPbqtCJE/3ubUVQSh3nk0NGQJ9utYxjHM/Isesq
qo0+0k/vEpH+gIDWvrBB0IkWDkLUIRyqiDvMquyaMLjXo7s4Eo43iDHLXcSdHAG2
GzEBL/ucvr+A2rSg/FMdq4I8lovtMDniuFbwvvP2oEbbwCA5XAa3CxkLLPDoQ9vp
cCwqviCvLXsXaRbkX6DrG23GXA1jOi1DRkDJjoQLfag+SbajAGdjf0vgAeAbaeji
Q/uz72+LxbQb8eJB/WGBmEmP+6O82N0JMg3FGCnclX3f062Sb+k2LXfgIFo5uBiy
ekFDwH3BBP6f6jHIS6bm1YxFz6WeQNLvgtAy4AKCbHOLuRbS6gUh/owPGOg5soTB
ji++PoTYKKmFfT+Dy31FxxI/YILVBb3b85lfIJ+XkgyXFpvmo1XZXAXvHTW0dXuB
xqAXDY9KZlVXbrWxU+ySnC2h8w7ckfEQnS6XermndfEWK3CaHo0=
=3zAx
-----END PGP SIGNATURE-----

--yr7PvhVWILCNS9DOaWpS634UiktJinw3k--
