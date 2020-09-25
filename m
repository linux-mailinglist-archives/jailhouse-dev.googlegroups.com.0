Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBXM3W35QKGQEMVEDYYI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x237.google.com (mail-lj1-x237.google.com [IPv6:2a00:1450:4864:20::237])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC3427809E
	for <lists+jailhouse-dev@lfdr.de>; Fri, 25 Sep 2020 08:27:42 +0200 (CEST)
Received: by mail-lj1-x237.google.com with SMTP id 26sf647172ljp.19
        for <lists+jailhouse-dev@lfdr.de>; Thu, 24 Sep 2020 23:27:42 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601015261; cv=pass;
        d=google.com; s=arc-20160816;
        b=UQBKhSUG04uOBNs7krOuBqE9xn2esrlOryLbJjcIX/mY0A2+YLAqXaESnf2aXsB+7G
         bjEv8ZXUh66TX+yBVWkCTFEoIvdcjRK3c9TYInMMOLoPOadF0xgg3TwdMu6uhz7J9RGF
         IC7BgyFwdEsktn907M6nYJFzglIDOYArZEpfRhx7h4H1gb/LaQKbNpmaoD0xmBsRdEYN
         UhGERahVf0wVUqXGz3Mhzeb+X1R2oaoRIiSXl/VClfzxFF2YzDC44m1jlOBjVetR2Acj
         mzcsqPLWX/Jajii68kpdSKkrQlQX7qokqmfT2RsfOU2Gw9g6N1ErwiE46IRHAVHc6WRD
         z+uQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=H3c4f0cM2i55WsJqDB1JlUBddpCc0tPLF0K8liWgFnI=;
        b=eKPagY1Lif0m0W+eQc+XhRoY+OCwcu3QERK5AyaWpmbpYW7lp6RMC+DDChRxKwtGz5
         v7xgq17PbQX1Zo+rJuOa79T1VtlhHwU9E/kOYx7Ov3+PIGvz6FAfg6Ny9N+Ub4CCg8Ne
         RClQuWtiV2V1wGk/bx890y0/iNAcyPWexOV6bbSRXuBFmaI42ypzGVjS9EP3X/SDOGUS
         ZujeWqbPaBXhk+46c+fplhEht/SehW4xQADnbZ6gd+Uwuig129eHYt7CWaUJZSZ1zB5v
         KMmNLmsrc8YjQ+er6z7w23C6jgY7gZD4x9NAkEABQ0IVqrL8cGuj1dX4Fw1tyr+mzbho
         U0yg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=H3c4f0cM2i55WsJqDB1JlUBddpCc0tPLF0K8liWgFnI=;
        b=bi4XD1zEcoObR48lWCoKNCkxO2QOYpadTIyQ8Fd4BBJl9ks8pNXe3PNFwt05Yj2vro
         naSPPvR99xiUvyhovmgXlvJGhZTP1cuLXKl7ZuVTMtDgEtTtlXU23lxnY/8XfkIY80Dg
         TVt/luIC931kOqy7ai/z9IiLi3mNHwXTUBK3dWd5LZk1wemg84ADWF50Zr10HILXXBAp
         2ppBMzv4uR1mPyIkZiOTy9fGl2Gbw8XJEmbiuS+NkAo2whZwmEBr0TcOwpuSVhpn2z6w
         ZHYlqru5IwFHAhwxv17FDvhFKcJj1QBkprfn51rnmTeHRfHFRgsiQt7AnOpZ/A+28/Vf
         HzlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=H3c4f0cM2i55WsJqDB1JlUBddpCc0tPLF0K8liWgFnI=;
        b=lqq+IjhJPoX+92GjlrFuPwZNe4slqeh8veCrlfgkARQBUe1T+x6FT8W138h9I4WI93
         AP3MUGaPLgYshxh0CfVDH3I+yDu91/d80eut2+kItpK3ZGJeKUzNlPda/8dE3aM9tY66
         5DSCBla5mxOuZHP/Oxilfp9eHSEKqMS0aUILaEl4AAFG3ySkiFQT/1llsMSry1+qR4Ln
         d1elSEeJTT4kkxh5awbzI+a0AfnIazOjMwPAsXkRvAa5c62eSGUGsGreJ4dQbg3WqOwZ
         f0mnvOh0+w5PJs2PqqmeiXamLW/OeG0X2ERjPiEYssU1cUzgnJu4jq5RkabCXrUfNjRz
         /BSA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM53216VyYH6vaqqbALsTPAUBQJNkA7YEGXT8q+suyxTao78OgDeHC
	MfsLfKT66fd3gHYgh9nPPE0=
X-Google-Smtp-Source: ABdhPJw6XVjULu1XbvaP8FDNYgnYoXxWNHrjFswLjpbhYUxUvik5+GISLzsPmSm40xp5JqKCpa+F1Q==
X-Received: by 2002:a05:651c:1307:: with SMTP id u7mr900421lja.267.1601015261724;
        Thu, 24 Sep 2020 23:27:41 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:5c44:: with SMTP id s4ls692819lfp.3.gmail; Thu, 24 Sep
 2020 23:27:40 -0700 (PDT)
X-Received: by 2002:a05:6512:3453:: with SMTP id j19mr904186lfr.92.1601015260363;
        Thu, 24 Sep 2020 23:27:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601015260; cv=none;
        d=google.com; s=arc-20160816;
        b=kBx6D7sp0mTqZodH4ZQ4PHn1Mp+Hs5sHnwICmkNnSCxNeWZrrmgg1oVMs4wuMV4vd4
         NKnZtNiuZxRv3p8gfftUOHWaozKe8ihkGaLSCJ+4q5CYNlfwl7FqTfOUJtRbKGs6HDpR
         R7QqoYx7+CEnXP/nHu2WPEYy81M07D7qjuIyOGVNpJWZpA/mxxoSJP0DPgwB3GOMOu2+
         PxBRbH/YQBpN0uOPoV0w5aDkweRlCjkNs4GRHDTPRMmjoboGBsJWFuTkJLed9gdg6DMd
         oa9u9SQBIrylJAbOWf/CrkT8oEw10uWBGlAOuHq/c+MlXmtgJoYL7A1TAzxfw90DQxQi
         IK/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=3aP2pRp8b4Fvkjhakug4iDO3zDyKdxdkgl82+FdGcY0=;
        b=WDhGB1a9lTD+7v8G86Deq+fsKXiE809nPbbN5/6oVHW791IG2zv/D6X92uh+pdm2Kq
         EXgXFDrO2yRZJANafkL+2q0Fy01Jq2FBfET7Ny3tPdepVYJmH4gDwsF9pNLF3/tocBiw
         nVaKSchXU2IEOMt5fWsQv0d6BIIAfxIHSe5hunS1B6z2FrjAqRJ1cwbeCSvw80WZ61RO
         eU6eS3Ijx65ovP4xIxpPVHJtIb9rc7kcjJYrYEbiK9wKmyJY1SWo6x7YBce1DYXOnITb
         3B77vBAgjHMgnyO4d8WKOsLrlh1sjKoxg8hpLP2MXTNZprZ5nWk6M4wBNXKqH5uuetNy
         pU8w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id f12si49948lfs.1.2020.09.24.23.27.40
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 24 Sep 2020 23:27:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 08P6RdPg021051
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Sep 2020 08:27:39 +0200
Received: from [139.22.133.254] ([139.22.133.254])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 08P6Rc03021824;
	Fri, 25 Sep 2020 08:27:39 +0200
Subject: Re: [PATCH V5 4/5] arm64: support ARM MMU-500
To: Alice Guo <alice.guo@nxp.com>, jailhouse-dev@googlegroups.com
Cc: peng.fan@nxp.com
References: <20200922064542.26274-1-alice.guo@nxp.com>
 <20200922064542.26274-4-alice.guo@nxp.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <49e18032-2971-e045-20a3-e2888ed23f07@siemens.com>
Date: Fri, 25 Sep 2020 08:27:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200922064542.26274-4-alice.guo@nxp.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
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

On 22.09.20 08:45, Alice Guo wrote:
> Enable SMMU for processors which use MMU-500 to implement the ARM SMMU
> architecture v2. It supports stage 2 translation that allows a
> hypervisor define the translation tables that translate the IPAs for a
> particular guest operating system to PAs.
> 

Applied 2..5 to next, with changes to this one to compensate the missing 
first patch.

I'll follow up with several cleanups for this patch (not all of my 
points were addressed). And I will also try to enable the zynqmp for this.

Thanks,
Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/49e18032-2971-e045-20a3-e2888ed23f07%40siemens.com.
