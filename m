Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBEFX5L6AKGQENAKBKWI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x138.google.com (mail-lf1-x138.google.com [IPv6:2a00:1450:4864:20::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B99229E920
	for <lists+jailhouse-dev@lfdr.de>; Thu, 29 Oct 2020 11:38:09 +0100 (CET)
Received: by mail-lf1-x138.google.com with SMTP id i21sf318996lfo.11
        for <lists+jailhouse-dev@lfdr.de>; Thu, 29 Oct 2020 03:38:09 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603967888; cv=pass;
        d=google.com; s=arc-20160816;
        b=vrwLWyTBIbb8gbsKiH4dGk/u5dTv/DbHqnzDWXzdvvi8/hTNwZkMLMEvRK8Uy2JETt
         UVgC5ElXlBV1dZkeVGgrHL7l8UxxE3OjwbRwJF8ER6ZCFthuZMau4czkP9wS7ZNgc1bt
         QM1m5rEyXox8wYV1bHs5Qsw3ZyNpUQGI7XEg5AON+p+CED6dUNN1cE8J2tlT0KUdH/XA
         1JvjU4XkY2lRpY+eORQ2DSwPO/ZIzDelcA9d1+wC5WlGYEWBvQtO1DsrEPSkVTZasThY
         F9ONPv07DrwEG58S7qKqnFkGC6DdGsIzfQwpLRbS0UBeyIYC0cnB6bP8eIeTXM7WbezR
         LJfw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=aT/Tdd+olzDomUveJVwEW9GC4Hk1anyIE0nXxV7EVII=;
        b=0PEVBeJ1yH+vrCMfuLq3a2WfQY1n+CwZ+h6+W1Zd9xTEAap8HzxOA4B0dndpNLWIAU
         ARdcLL6FK0LwjEIfJzehed9Z6NSLqyoNWnk+oNMUjbPaisN3vPeVgd7Su7mi0HL+Mx+l
         BQP9ASGdfKxqkW95qOJcbzO+kdahLKlfxvzQr8QZZoJB6F+4DieghYe2NggqhLLtPdfl
         IazR6POmb8cDss3twmRXuwY+vSmvLrLm6wlnHArqMkwILwmhKvS4BA3850GJkRwiTvsi
         a9fYfWtdd+QtShFfxftaXDOV3fdMr01Gd5oGZhOlEllrnquFmalA4f/OIiUytGvHO3Ws
         fd3Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=aT/Tdd+olzDomUveJVwEW9GC4Hk1anyIE0nXxV7EVII=;
        b=TTWXIaJ/TJQgeInL10Hl8opgQKY2Y/WcsV4azBtyrARZCCcmsiby6fu3QcJko8eJwE
         JrFODXGo/cH3obYMu7QV8/kZX2W9fMB/sQb293kTiw2jrYtUPhrniqnlpdNwuhd70tU3
         rRKrdtqFq8csmV/aEKgoF9O2hSqZBEzZt4TDdL54u3zb1GYcCediisl9kiab+36JmDjR
         Wxzh+StA08RarMF/FivsCKDQrzDmzIfen91c/vHz/TMgcxL+JkpyKo3nYP7yaTmDsIVm
         dxus2aySwlFsPslmeo9lev8nmdTEAjVbfN86roKic4kZfJmr9B6oouY+QKmd/kWy2CU6
         q8tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=aT/Tdd+olzDomUveJVwEW9GC4Hk1anyIE0nXxV7EVII=;
        b=s1F2jG3d8O8HsFCm4CX5Cn1weLatV3DegTS+xEiG3AY8olsU/P8Dt+iEB5/Wb2fyMP
         WyJpU8r3MhNSKCf8iFnWD/KCzfIr+ImAlO9NLGeCklv6PN9J/hiBiTRJZLKm9XaZg2ot
         OqKcNfB68tfm5Ax4Dc4KPZC/Z3IN0i+GzCUCJ5LjkcI5AHmQ6v/NPGnVPwNhwy08F/eu
         A77x+EbXI/BrlpUCTuWl/5HfDTH5j5QQTxlu2S5yxHlELa1WGhLDnNNmUbPDEYQVTNEM
         i2CtrZQnZKyDwL4pq/QOsiIfjgOwspdaIFD/tShH0G59ONH0fqmfabDYIKqM7UKF6ytI
         7C2Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5328Fv6xmOfRWzjHG9UVrFue4cVvNhM0ccBBDC+KBhPSWBYR+oAE
	WPC+WnetuuJReAis6kDa3kg=
X-Google-Smtp-Source: ABdhPJxj+xvEL/+7hDzWW0k3LF/pooUZLt3cSiuwkI3gmYTq+Qc0Yp3QW0uBFG21K4ubB3TSKmQmTg==
X-Received: by 2002:a19:80cd:: with SMTP id b196mr1466537lfd.118.1603967888737;
        Thu, 29 Oct 2020 03:38:08 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:546b:: with SMTP id e11ls1290321lfn.0.gmail; Thu, 29 Oct
 2020 03:38:07 -0700 (PDT)
X-Received: by 2002:a19:8d0:: with SMTP id 199mr1416088lfi.529.1603967887217;
        Thu, 29 Oct 2020 03:38:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603967887; cv=none;
        d=google.com; s=arc-20160816;
        b=FEHgg2VY58NZv1hPz+OHT8iWk6ONx8gZfrfTlRfN9GXq4KHVWWCiu2YLD8XbXfnkpT
         KZvL7MzUl+jfADN3GqS5Tp4P0boJiHzXYbeU8HywZJl1vk2gJ1aDZrt7m5kHnRGzZpoI
         W6/G1lJFxtGUmEQ9pB1SqIZRLC64CVbNMovfOJr72bM2Q8ZJRb/hcOFYbW7jaRhhL9lr
         C92WH3yA+w/26ubXX+ZrD+2GkGPreI/9iXrTiQ8cgJBZVYMSquIfeXZvj7KfN6vf6GzV
         9NvFwcY+aHHNK9wKa9IK46RlUyUrpj7Grcv2n3q0bA606XwT/ql3+9WongcAE5eM0N7L
         VAgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=Tl2zLfcDmbYef2MBDAOPfevIv2slGPN6djknJc4dIQo=;
        b=Ixp7lA6pJTvoh8NjTzvj5yaiJ6uZpoj3wUHXITjhSK5nHpBIChGFuOR4TaJg/NLqXT
         mbKg5Cx1YLCLrXLsdEzYJTZ5An7Lvqqarvu0D8ybEOcZz717znNhXsol8Sc3I63b2JUb
         mR055oOS1aTOXifrSkShFVKWJhhN5mAiTXckiQt18PFmwiVAlPiDobsZHfNgvZCgw+Ga
         Hjx1jiMJvncytUiEmxOvGJa1EnY04WhQS+AN0HZQUIch6xREo3rMDdkm01ynQ6I+zufV
         5T4xm18qNKhA64h6R8g7OZDlsXUJnvoy4Y1HKzcjv1WuxHPnNj+sYqXbpK8VHnBz22EU
         mCmA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id h4si73220ljl.1.2020.10.29.03.38.07
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 29 Oct 2020 03:38:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 09TAc634025961
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 29 Oct 2020 11:38:06 +0100
Received: from [167.87.42.1] ([167.87.42.1])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 09TAc46Z031759;
	Thu, 29 Oct 2020 11:38:05 +0100
Subject: Re: Jailhouse hang on NXP ls1046a ARM64 platform
To: Peter pan <peter.panjf@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <58057754-ee40-4583-bd44-db19a6706069n@googlegroups.com>
 <bf532fea-eca9-1c8b-a814-682e34962332@siemens.com>
 <d66e8b2f-e499-40d2-8257-4d93597bfff9n@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <8bb875bd-4f30-4dd9-707a-6bd2e54d0575@siemens.com>
Date: Thu, 29 Oct 2020 11:38:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <d66e8b2f-e499-40d2-8257-4d93597bfff9n@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
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

On 29.10.20 10:12, Peter pan wrote:
> Thanks Jan for your help. Now I have fixe the issue, the issue is from I
> mapped the whole DCSR space together, after removing it and adding some
> memeroy region of IPs,=C2=A0 now I run jailhouse enable without any error=
s.=20

Perfect.

>=20
> One more questions, do we need to map memory regions of all the IPs in
> SYSCONFIG?=C2=A0 or only IPs to be used in cells? thanks again.
>=20

Only used one. You may even leave out IP from the root cell that was
only configured during boot-up and will not longer be touched under
normal conditions during runtime ("freeze" the IP, e.g. to prevent
malicious misconfiguration).

BTW, do you plan to activate the SMMU as well? We are current stressing
the new implementation by your colleagues on the i.MX8 and the ZynqMP
and could use more testers on other silicon.

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
jailhouse-dev/8bb875bd-4f30-4dd9-707a-6bd2e54d0575%40siemens.com.
