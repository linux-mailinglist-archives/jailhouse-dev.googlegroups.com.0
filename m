Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB37UT6FQMGQELIDQEEA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53d.google.com (mail-ed1-x53d.google.com [IPv6:2a00:1450:4864:20::53d])
	by mail.lfdr.de (Postfix) with ESMTPS id 040E442D63A
	for <lists+jailhouse-dev@lfdr.de>; Thu, 14 Oct 2021 11:37:52 +0200 (CEST)
Received: by mail-ed1-x53d.google.com with SMTP id t18-20020a056402021200b003db9e6b0e57sf4670104edv.10
        for <lists+jailhouse-dev@lfdr.de>; Thu, 14 Oct 2021 02:37:52 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1634204271; cv=pass;
        d=google.com; s=arc-20160816;
        b=NsHTtc1OEx0BXi1o128Jw95TvJ6LUWO/as8PdqGUqEILllA44NeYjDsGQchminZSWM
         G4Oojn473NvRZkpjXcsyP4Q+qKBbH9Y+x+KDpWmblryPK+f5GEOkGVnOSjAXLgs+JeVQ
         XY3GnScuxfNH7AzltlknK7Qi4i3KPuQtoEtW/2BlOuGaxvIHRpnZqNaUDXaJYUew3keo
         iIV4hszF1e+aYTUbHMc5l2qz8/fqSltVgsZ8J/MpO3NsyEyYUGXc7xwQGUE7YdS+ItpE
         lcGYM1wswo7EIwXYKKu3KRYkRROxKet7jBV8DogFSck/Al26UnDFiouL5PC1kIF4Sc2G
         pNlg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=3IDWdyiTuUwZPFRj79/rKdMBWLZaVDFuZQqTwWk3wBM=;
        b=SU/hIbhGB25aCKJIQOsPKVt+WVvGZVzdplVdY37V/OQ3VmWKhyIA/pgeMuVEzG5upw
         Wh6XyK7BcdlfXbIjssasmNdL9mF3uVYOuZM3KqjoNGn/XSIh6CShJyaG034L7ckxxq2z
         5/Q5TQH//VSE3D6wEaHk2j7QpO3oLKaPIJT1ApPGm92CjI+d/EGJ/zV5UI/uTCYXNwkr
         /s2Ny7lvK85vdkA6zuUjrFKqlYpu/DRjzMN64deOhGmwNSFaB1jeZcBZX48jjLaNeRgg
         sJtbrtseJKPx6U3aLUKSlESq2j38AjVBaCYYEdPfBfaRl6lMWKGKiBYqKQmCP325KYdN
         4BkA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=3IDWdyiTuUwZPFRj79/rKdMBWLZaVDFuZQqTwWk3wBM=;
        b=jMDlnJDMTs1fhm4HeA9SN8UPhY+b7D/uZh/K69w8j0nueUKfwsJd7wU0mle464jjSZ
         nmVmje8Wh7ID3i9Wz9m5S5Sun8oTLaY97SVJHTC89G5aK/HtFXp625RNppbnmy7qiF9u
         9YA9cgW6pCRss1lsPAN8KjKbavV1XHyCkcosU93Vk0+uWWGDa46LCcFtSBkvMU+rb/Cg
         dqzCrgF9NNQ28O8IJJetSPUvyGv/kifLbbmOdzX8qg6aAHKYSDa78kGRItN7b8wtR3G+
         FS6bUb9ZgOaYgACDPWKNlrZj276e6EoLdjqHQuC688C47pSeOjVNePPA1gTO1UsVnoz+
         /h/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=3IDWdyiTuUwZPFRj79/rKdMBWLZaVDFuZQqTwWk3wBM=;
        b=aBfnTBmgm7vOkBN5X9N4VA5PCCrIVlwfM5gHeUakQh1oClhrgoFJSeLjHaDfHM75BL
         t1GZn4cAd/jiAXx9gPxClJfQAN7qp/BxTxsuUzINYpPY5Nx+4B8J0XM+eaDMxpop0qV4
         mbh39zQ8Qpu1y6/foTU4JOHcJOgjVkYfheB7yi8bAJRqiYe3Eoyvmu4jHfPw0DuBPFqR
         GZxTu9zG91GwfyoEUkHNRAN/CrmrZg8HRszTPq4nyYm1OuhGiehrlA0PacFyEQR1dR/Q
         FZLMrDGG9BCt6hgxACx32jqut9i90Vunvx7Ig0lhAm/No/obSO3hZzSi35F78YsUS86T
         aXFg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530J1iDPCHlKiJxtdjlrLOfp7fWGbx0XbLkQ7jiJsuaTf2XXvJZS
	Jp99JjOyO7MWQo/cR/ds8Fk=
X-Google-Smtp-Source: ABdhPJxk2s8S7FZu7xmTHWOGbPdSzN8Z3ay1mrZzQwfRnVe4K/rsUE0ji0lcPADrtnHLCunVvuxtAw==
X-Received: by 2002:aa7:c941:: with SMTP id h1mr7314387edt.128.1634204271750;
        Thu, 14 Oct 2021 02:37:51 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aa7:d39a:: with SMTP id x26ls4723381edq.2.gmail; Thu, 14 Oct
 2021 02:37:50 -0700 (PDT)
X-Received: by 2002:aa7:c741:: with SMTP id c1mr7214211eds.194.1634204270568;
        Thu, 14 Oct 2021 02:37:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634204270; cv=none;
        d=google.com; s=arc-20160816;
        b=cupnT+Ljq8DwS4adQCUOId1Bat7ujVrTH/BXHySJKP3PgKITKKsJaw0m5YTKOrxwaG
         V1yAjKrqCewno/S1r5wRlHk96zR91QJFMwpnUFN21PeHm+tWQZHuJaKtjo6RKfVJpv3w
         W5iD5CFjwA4vkwnoTBnyIRZ7GqA5w5yH8I2ISa/E5q7tzdmiF8WHyCU2TL3U40EU90ZC
         ieOEFOStWa8o5ktjsT4UcujwYykUIU4PRWIeCuRuwkGLeG2kPuYGMYx77AWCjVUswI1C
         3GN+dRSoVT0aeVnqKIBI6NujrpszRhd+bmLHWB3xFCNglKOkPu37gqRappv4zSSMDLKi
         lvIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=16hK7wU8NMOsJUYVtACD26wO37qWuEuBIErFaw4f3pM=;
        b=lgAmkHai6P9bP/U2J4NSHutxDe18JEF5xOMS3NCwbELM5MvEEFeHUiR973Xc+VQFmV
         8vwEyjFAQurYGuhGCWgl7y7HJYrCmTeBBV4QJeV4YNXBsqXazOhw9u9j1zeVwk0VW/ZL
         5nDvg/rffoZ3KFb7XBpbYRFfNYqLHWplDOUsKr1Na7cSJfd13ema7O8YOUdW/WZFh4nI
         eWwnjIoheczD1Qglh29IMUm5Z9j7gupZq43wuacZahfy2Qkd4twRLFXZyz1DK1n4+03m
         maYNLQAV6CE4OTc43vtUg7A9LtL3dgzNXD/Z3fnWAlpdsgkFOoD6EoQ85wBSKxP5Vuuo
         W2PQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id s19si168432edi.1.2021.10.14.02.37.50
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 14 Oct 2021 02:37:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 19E9bn2k025802
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 14 Oct 2021 11:37:49 +0200
Received: from [167.87.2.42] ([167.87.2.42])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 19E9bn33032320;
	Thu, 14 Oct 2021 11:37:49 +0200
Subject: Re: jailhouse pre-built image for QEMU x86_64 boot loader issue
To: "luigi.d...@gmail.com" <luigi.desimone3@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <23b3ad44-6475-40c4-a099-14c065a11c9bn@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <cf2aed9c-700d-6925-a56e-3bcd5d34685e@siemens.com>
Date: Thu, 14 Oct 2021 11:37:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <23b3ad44-6475-40c4-a099-14c065a11c9bn@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
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

On 13.10.21 12:35, luigi.d...@gmail.com wrote:
> Dear all, I noticed that on the pre-built qemu image for jailhouse demo
> there is no grub installed. I need to boot a specific compiled kernel
> version on the qemu VM, and I want to ask if there is an easy way to do
> this. Thanks.

I assume you are referring to the jailhouse-images output here: Yes, the
QEMU instances only get a rootfs, kernel and initrd images and are
started from that. Study the start-qemu.sh script for details and for
the location where those artifacts are picked up from. Either replace
the images there or patch/fork/inherit jailhouse-images to build your
kernel there, instead of the one we integrate.

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/cf2aed9c-700d-6925-a56e-3bcd5d34685e%40siemens.com.
