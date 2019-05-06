Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB7MZYHTAKGQEQKHZK7Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x337.google.com (mail-wm1-x337.google.com [IPv6:2a00:1450:4864:20::337])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB9714E92
	for <lists+jailhouse-dev@lfdr.de>; Mon,  6 May 2019 17:04:30 +0200 (CEST)
Received: by mail-wm1-x337.google.com with SMTP id q3sf8367645wmc.0
        for <lists+jailhouse-dev@lfdr.de>; Mon, 06 May 2019 08:04:30 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1557155069; cv=pass;
        d=google.com; s=arc-20160816;
        b=GTeie28PHV7BB7JPGjsikqdbgwlWl/KEYtftWCABUHydrHtMhvUZEdy71TypEKPB5Y
         DUsAuLYaNtKy7nofyjePmqWBu+6k6DKHyHSfkb9eCRqsm8cucDhEdsogoB+bKcQgLqH9
         N9ugUcM2VAUeHCxKP77Q1oA8YMdqjgFskCDOGkCU7Olc/uwnPj1SSmUn0ZKlUoJod5BQ
         2iG+/EBJMeglzbvluUOEHCqtLHKD2CKsqIvEXoY+9eH+Fy9mq/BXh98nfN2ekiUDowIy
         3swz+isPkR3T8bhSFlCUBgaQmy4nv+vmXCsTh9GbbXwbYe4ueQnu3X8v14osUtCK9p/y
         iHmg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=rCoFllZQvxh2NDFKLoF2EyJyfrpvcgzTtJo5sihbzpM=;
        b=Svw1EOTBMdT0nKqeaJbsO6SNWF23ujBak3/WgHWxNxp8HjVZR8QidmImb1uoha4quK
         gC94bcvWmxJSf9i/qtJYV/30AGwejnaIgcCQNZhqIsWphFcgzZPNzb/s7DaMZs1nV36Y
         85NNYq/6mK+YfJyCrU+0aNZHDAFz2fDhAgYOdfpKFPGjhxIyb6Ybd1/HHT9Sg8yBkLCa
         6hXxK6Nsr6AORKe2MatHz6c7T+MWnXhhZelf52l9eLWCr4YSpiITiemQsbDbd0bPN9kb
         5LHwdOg39M/jCLrgWC7nrt71/1/F5YGLhAX5tbT4nHJDGmuNBxkY3u19vKRQbTPKZ6rS
         q/ew==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=rCoFllZQvxh2NDFKLoF2EyJyfrpvcgzTtJo5sihbzpM=;
        b=MWy6pg4yUx9VtQCheug4a0Q57Ak6UhNnZXs0Jr8mWDKM3tngRXmQ8+t8tQb/TZ/EcM
         jjY0WTBBOFPzRFj4Lemrlrc7bnqshcAyiGOt/Sbh3FaTkxHeh2HvsGC58YLiE6aBmwx8
         MAYyBScCFnj6EJp6EioLh0NIpFw96At8L8OdO49QAdXabz0DqCQsietC4xGrSXS1gz/s
         OaLXJ7WJugu5Lebi2EEF0ue6fCk4EsXS3ZVezT8k4Re7reCPAmkWgJjJ/nCGeuW5qLaJ
         SiGmXtysB31ROum2jhFqbK5vO/7SgbbD83+gI9t2T4CCKc8gWU1T59EvQmiAupsHaJBP
         E9Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=rCoFllZQvxh2NDFKLoF2EyJyfrpvcgzTtJo5sihbzpM=;
        b=nA6o7YXLQkpeFvbnkx3Fr9hHpMUi1ixz2/o2HTCx7vQkosw8J02JMG6Lq5g7K5M3dg
         WUiyODX6RQNdZ4ZMjuWBl0s0fIPhxw5yIMQQLB+40yGMtWDNbfLJQ2FOrIo58mRysFbX
         zrf2fNp45+x6yRt/dblD9PrTXEjS4mD6AeYvwah2LAH92sDVLYSI6UIKGBy97EfZ3pu1
         sRiOBTeaEjlA5YxAD2lzvnuwd5kA8DYeHQMkT7gCVAB6GzEDJlQKg0w76ceOU2q2Tm/L
         EbRsX+Ddg2rCYzwHpLzsALaDMBIgNUjCsgmExAFG5F/Br2my8jeNmqkHpL4+m9DG0N89
         PD1g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAV2OqJ4G4kSGBJ7pxf0N23iLjmBj9UCgavuF+Vt8bvJAbZuhKH+
	bdHGGhUb0voiRz4TRnySE+0=
X-Google-Smtp-Source: APXvYqyAuljR88rHed6PlhMplzTA1ODkPCa6w/L/IATJrSFn0KGXJsfQqp/VzIFdaBxWEC/pxg8V9w==
X-Received: by 2002:a7b:cb11:: with SMTP id u17mr18066080wmj.144.1557155069852;
        Mon, 06 May 2019 08:04:29 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:4106:: with SMTP id o6ls3906561wma.0.gmail; Mon, 06 May
 2019 08:04:29 -0700 (PDT)
X-Received: by 2002:a1c:6342:: with SMTP id x63mr17133389wmb.58.1557155069005;
        Mon, 06 May 2019 08:04:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557155069; cv=none;
        d=google.com; s=arc-20160816;
        b=aoPf7CEom6kc9wvlK5KLEe+YgpGcu/oqRAOxXwAwhcDfxMT/z46LcmXxrLR8o4U1uT
         uQ1D9YdQtSefRnv4UKwQv/9ECBbN44gR2iwyG5DkK5bHqlFT7d34QnmBofznYcsO2Rcd
         7os67pKVKXrZCwG/Xs2uAu2jvbu+NyoNuuiQ6oB4+kVG4Y+2dd1Hpw62M2yeNVWc8zls
         TH78JRKrE5Bf1q8YP14LjeEhpF4JhwpPTYqSTIGlm+wpV4azxNUDYL2EPPXfPywo9tvY
         hoBDOeLCkg2UIBsMO9TCA/FcdjEmFBTSfe9230TyfgURJJTFGAJX3eTDDBkW0tFIpki1
         DNdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=8Fe1ELPZAmD7viVTtgSmVYvKGpXFLhVJsGR3USPu+fA=;
        b=dITZob9RyXkbYU0VWM6F7aoAgOvsArA6PXFMptiQq+nK7qDIym9mkGcegBAhhHH0/6
         Gatw9DBTswbOc6K4TO2TVkCJLwaczNARWJnEeSa18fTYwzKIVBEnmSYc/FERxH7nKwjH
         +qMTg56AOB1fiJP5K/TRMwol296bC+UvO5WSzQIfjO6N2a0TAlgtwhhUWUhTjs0A52Cy
         AIHtU75a3xaDaZJC8/DpVgZItp55ZPn+cLMN0c6o76ibnx60WhTuEdUzUcTGumk0PvXa
         DBPo8d1v+4nAlnIGY5nG8S6adbiE0I2aUzn9hLW2Vnu7cdkDFHB/YVx8Mocf4P0Fs4C9
         hJRQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id y72si1001711wmd.3.2019.05.06.08.04.28
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 May 2019 08:04:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id x46F4SkU011435
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 6 May 2019 17:04:28 +0200
Received: from [139.25.69.165] ([139.25.69.165])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x46F4Sr9024220;
	Mon, 6 May 2019 17:04:28 +0200
Subject: Re: [PATCH] Scripts: Fix for Parsing DMAR Region under Reserved
 Section
To: =?UTF-8?Q?Hakk=c4=b1_Kurumahmut?= <hkurumahmut84@hotmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <62e83024-118e-4109-ab5e-330bec67389f@googlegroups.com>
 <de3120a5-36a0-a681-1642-5fbabaf6b524@siemens.com>
 <6696c5ac-a0d9-4574-9eff-dd07eb08280c@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <1dc27db0-aaf6-3107-bfea-70e2b4b75551@siemens.com>
Date: Mon, 6 May 2019 17:04:26 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <6696c5ac-a0d9-4574-9eff-dd07eb08280c@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as
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

On 06.05.19 16:47, Hakk=C4=B1 Kurumahmut wrote:
> Hi Jan,
>=20
> This is my first contributing, I have read the documents.
>=20

Yes, and this is appreciated a lot!

Thanks,
Jan

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
For more options, visit https://groups.google.com/d/optout.
