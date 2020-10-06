Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB6PO575QKGQEACMD63Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x238.google.com (mail-lj1-x238.google.com [IPv6:2a00:1450:4864:20::238])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F0F284515
	for <lists+jailhouse-dev@lfdr.de>; Tue,  6 Oct 2020 06:50:07 +0200 (CEST)
Received: by mail-lj1-x238.google.com with SMTP id q19sf2449241ljp.13
        for <lists+jailhouse-dev@lfdr.de>; Mon, 05 Oct 2020 21:50:07 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601959801; cv=pass;
        d=google.com; s=arc-20160816;
        b=NAmreqYd6s/9oOCm6u9Szws5e7VhEdImwx2FKFsmDd45hSxSsAbpe2KDPaqgJz9hHL
         dQ4tEPxF1KuRiKbhq/T1g1B6Ie3XweSYHpkLQWA4+rLGnRqI1R0PrrtTkbwLG+ytCxQA
         geN0JH3aXJ7sCPTy6/cKKkjJAPNKm5MC7VNXC+FKXGLV1bq+W0G8r6AJSblR05mQieAg
         m6eWpUf4Bh5FQTNcLfCTA8T9g5nbM+Omezh54Gi2njbjr1yJHt8dFKiBGhFeTENp2rG/
         GkYgYSHi/pnoCJCIQ29rTs37on3pAXb3XXZe1YPSCeCl3/ACN2vGIV41O4vUt8IbV8/2
         I1ZA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:references:to:from:subject
         :sender:dkim-signature;
        bh=No9Q+LrB5dTonu3pMyD6Ce2uAfjvbhV2miIlREtxZ+g=;
        b=t/3iUwmYcu3xR/P7YNIP+BmJviClgEMReGI8AIuHoh4qUONW4dPMeZXzK6JlD2uHNX
         Q3/EYbALf6LBLLAfs1bowRX800RKwzc+vkr7p62Fg1L6ACJwIY5Na3AOzdR7mY9sA9XY
         8bYDpEwFxiUZKQMd5TM+hSGTiJ5N6ocCDLCdtcVgLQAe/bp+mi262H4lO1PC9GJ12k03
         ihasEKCJRrV1fxs7bbNIHrcw7E1xu7oDH2E+x8yXuFn7lBEQnSXlUEeNci672HuI6ZCX
         09woTgaeQWqvXsrqgCoSzngffocdF0nEcd4XeBqcx6BZAobYC0FT87OCSbI39wOZAFj4
         aLqQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:from:to:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=No9Q+LrB5dTonu3pMyD6Ce2uAfjvbhV2miIlREtxZ+g=;
        b=teuCgpYaOyIOVP5/GQZ12DqXu7JY/OGaEdwLv+7MxQRettnhG+o/OogHVjNBI7fe0D
         3nRWYBY9InO9VZ5DboXrWPBtDWSNqu8MYUWaF5UsFrzyHt5Sg9PgKYW4I/AAMntp6yaF
         vVs0LEZ98ur8TsLK0RqbHEmSyb0rk5Rd1q1bCjybA9wguMo65xMSzFkAT5KRc3UkVaRs
         e8zRea4Nvf+meMbyOfmad6PH7Y6GJonN3FwMm8iqDUZGMeeudCvdoOqlGBRwiTv+8gfJ
         Dl8P9EKNa7pUCL/Zm9Ky68o7bnIYvKKora51mBWdqkqrgbuWx90fxraTJtkeOjPdNjt4
         OLbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:from:to:references:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=No9Q+LrB5dTonu3pMyD6Ce2uAfjvbhV2miIlREtxZ+g=;
        b=miXXC1q94OPJ4qthiVf80uojIK+aYPbmJlkvpblfJE2Ewwo7M3d+tTIZDgdg53cO3n
         c+0Beo7zD1pmnbV4aJvWUoeJC9sJqzOYm/drr7Z604EilPWDA64IiD9yUi3VlDtQ3QEC
         i6kb94hSIxzCKwZnk6JiN/n13jd0YDb96JSJqEVahh6OThML6AlRwC8G6K4sCJ1luK0w
         CKQSZDmTzAE3mV2HydkTUrbFHurZdo0rUOJwohCb++2l1Yn2d2/5YURZv6l8Bzm9Xeh4
         1y93+RXdZW28I7hjI3XVwDzrTd68382RyYf3L/r+JX+P1/Vd4lMQJ0j6gHBVKoXCcrKu
         UZhQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531WtGPYjugECN0IMO537fmiUzdj8Y4Yi7lEdz2WacJ3Vqtn8B6U
	6PA4HhNPz+33UjbRfETfTxM=
X-Google-Smtp-Source: ABdhPJxZ7L1wB+LIFuDuRkPaLmlqBk7/QaoDxhO2waygnz4V8nU6zRGxXOEyGvr6nl/UMG27tYOgpg==
X-Received: by 2002:a05:6512:3453:: with SMTP id j19mr929482lfr.92.1601959801557;
        Mon, 05 Oct 2020 21:50:01 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:554:: with SMTP id 81ls1298744lff.1.gmail; Mon, 05 Oct
 2020 21:50:00 -0700 (PDT)
X-Received: by 2002:a05:6512:512:: with SMTP id o18mr921561lfb.328.1601959800393;
        Mon, 05 Oct 2020 21:50:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601959800; cv=none;
        d=google.com; s=arc-20160816;
        b=FUwbho0Lcq/qiH92etS9SohrmPN5zqrUYhcCd2VkGacHG2580u0z2swD4BiZJcPv/c
         inA+HDKmN+EruCa27Dd4aC3Tgh+mGwzPKsipx1fPcXabT+ZZVsKxZg9jPRJ5BYrSaCwQ
         f0YjQP04UjB5ZI2QkkcljyYN3COPcv7i+NsFQ20I/mCYFYD8C9+hFWhg0A98EPVBBJgT
         bmhJC2JGdnF9mupaorqmliUNV46s506cpQ5wV7EX6XKaUgV1c2/E5b0jJCqEP8Zr0BWf
         9mZEPg+GHcHH8DcVVxGSuDi5ZK69LLeb5lqeUojBPLJaL/AyJ2xdE3a6M2V7L0+6CUtf
         d8wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:to:from:subject;
        bh=bahHsJ2khA9ySNGxxOYJSjIeZIo+Vr9A3WVTe4nkxxU=;
        b=i8rp/Pp8PVb4A065AKIbOIuNcRqVAkLd+Zf4QwcTRik+tQBl2QIZEeaCLLJsWTcdj+
         qqKlXlm1lpA0fFa0Jk94kkUv0Z8H8pBfWSEoTI4LkPXwiGtkO1jwd4elqKjtuaOIOjP8
         AV248WkRwCxhU5wAOl37r9+ejzqVI6iaS3KKgQhS6ufAaDQBht9x6u3eHcBbXs4QY0ho
         Qj7kf4PV89nQqa/2GyPyS1ng7Q02QjLbmPs1n/94spRW0Z/fNBIAQq3p9d7Tx696GUr4
         3+Y4EKyMWEAjO9LM2KCrj4O/n053iBCw+Z7QG3HbScdzwGVL9/XrpmFmIrMYOjtmAShu
         zs3w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id n5si45866lji.5.2020.10.05.21.50.00
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Oct 2020 21:50:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 0964nxCr019207
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 6 Oct 2020 06:49:59 +0200
Received: from [167.87.160.159] ([167.87.160.159])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 0964nug6028698;
	Tue, 6 Oct 2020 06:49:57 +0200
Subject: Re: [PATCH 45/45] arm64: smmu: Return StreamIDs on cell destruction
 to the root cell
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com, Lokesh Vutla <lokeshvutla@ti.com>,
        "Devshatwar, Nikhil" <nikhil.nd@ti.com>
References: <cover.1601838005.git.jan.kiszka@siemens.com>
 <e0d420547c1cbe637a40bbf3027e82c908271150.1601838005.git.jan.kiszka@siemens.com>
Message-ID: <1e845d73-64ce-92b1-aecd-a13505bd9830@siemens.com>
Date: Tue, 6 Oct 2020 06:49:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <e0d420547c1cbe637a40bbf3027e82c908271150.1601838005.git.jan.kiszka@siemens.com>
Content-Type: text/plain; charset="UTF-8"
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

On 04.10.20 21:00, Jan Kiszka wrote:
> From: Jan Kiszka <jan.kiszka@siemens.com>
> 
> If we stole a StreamID from the root cell, which happens implicitly by
> adjusting the matching SMR, make sure to return it on cell destruction.
> 
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> ---
>  hypervisor/arch/arm64/smmu.c | 22 +++++++++++++++++++++-
>  1 file changed, 21 insertions(+), 1 deletion(-)
> 
> diff --git a/hypervisor/arch/arm64/smmu.c b/hypervisor/arch/arm64/smmu.c
> index 347ce223..fa583745 100644
> --- a/hypervisor/arch/arm64/smmu.c
> +++ b/hypervisor/arch/arm64/smmu.c
> @@ -454,6 +454,25 @@ static int arm_smmu_cell_init(struct cell *cell)
>  	return 0;
>  }
>  
> +static bool arm_smmu_return_sid_to_root_cell(struct arm_smmu_device *smmu,
> +					     unsigned int sid, int idx)
> +{
> +	unsigned int root_sid, n;
> +
> +	for_each_stream_id(root_sid, root_cell.config, n) {
> +		if (sid == root_sid) {
> +			printk("Assigning StreamID 0x%x to cell \"%s\"\n",
> +			       sid, root_cell.config->name);
> +
> +			/* We just need to update S2CR, SMR can stay as is. */
> +			arm_smmu_write_s2cr(smmu, idx, S2CR_TYPE_TRANS,
> +					    root_cell.config->id);
> +			return true;
> +		}
> +	}
> +	return false;
> +}
> +
>  static void arm_smmu_cell_exit(struct cell *cell)
>  {
>  	int id = cell->config->id;
> @@ -468,7 +487,8 @@ static void arm_smmu_cell_exit(struct cell *cell)
>  	for_each_smmu(smmu, dev) {
>  		for_each_stream_id(sid, cell->config, n) {
>  			idx = arm_smmu_find_sme(sid, smmu);
> -			if (idx < 0)
> +			if (idx < 0 ||
> +			    arm_smmu_return_sid_to_root_cell(smmu, sid, idx))
>  				continue;
>  
>  			if (smmu->smrs) {
> 

Nikhil, Lokesh, something like this should be easily implementable for
v3 as well. I just don't have my setup running yet to quickly test the
result (and I hope those tests will not require such a series for v3 as
well ;) ).

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/1e845d73-64ce-92b1-aecd-a13505bd9830%40siemens.com.
