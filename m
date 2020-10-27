Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBMN54D6AKGQEZBQ4N2I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53e.google.com (mail-ed1-x53e.google.com [IPv6:2a00:1450:4864:20::53e])
	by mail.lfdr.de (Postfix) with ESMTPS id 683EE29AD1B
	for <lists+jailhouse-dev@lfdr.de>; Tue, 27 Oct 2020 14:20:50 +0100 (CET)
Received: by mail-ed1-x53e.google.com with SMTP id t4sf673341edv.7
        for <lists+jailhouse-dev@lfdr.de>; Tue, 27 Oct 2020 06:20:50 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603804850; cv=pass;
        d=google.com; s=arc-20160816;
        b=jtbOvaKzVsM1czMuDmdgAzXtFYYBv/yrcO0kVvfFZUV7bbMkaPFahA4UbrgWzhZBPx
         sonoh0CjvwMiqzuF3GXKy5/9zZCjkcDGzyA3B+dP4Yap4N2CTTh6X6ECYt0h47z2kw0M
         s/gaNPRNy562KxfzVzaImYopf/AfnK6Jumf7gD7uFNqs7XCRf0eF3EDjdKNNMCOWE1iO
         wT931PW0g7i7PpdzU2Si8zy4GN1LetRbftmkThsv6oEBsSxYV1VLS0c78PWYKfM869Rg
         5GLMbvSYG9GRzIBwDSQz2tROhMLNLpqBSqT0CytAstMbHsK2I5q8IDrXthJ9CpyBxYrv
         H71Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=47+3q4k6Q3ZRJ82DMWLgHM9baB7pgYKThRa3GbcRo2c=;
        b=lNMoqGHE6xg+Rk58I4vyk1BR8Pw6sfYtvRMebUAbkeiX5tIatFDF2NX/aADpF/D9mf
         blZwAWWg6rODuUoJvM7mrvhJr1UzzW9ttzQjMKzs2iAvlTWq99wTGql/mOeWzrfo5j5+
         DaMZogIjMAdYukfmE3RQlrjra5OuNde4whDQxSZWOmmMdW3fi/uzmK3ZxeeG1JQiPDrd
         yIPTKgML1Kysxu64+mhSdmUbriyGsq35aemw4Nro6ZPl0ud+WEvT8QMUsCEqke5zR9xZ
         v0YiJfWhVC6susr+xEgwHca8MSPZCxQtRmWm8KGPgN4x1AiGxQoU6ad5DB3lcQ/PlsoH
         gEfQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=47+3q4k6Q3ZRJ82DMWLgHM9baB7pgYKThRa3GbcRo2c=;
        b=Fep+O3avzkIUKM3TbsTzwiDZ/D85GVkfyXRq6oCjiRHhcNDm5HGc6CCRWISk1XTrtu
         tITkdf0EmsPLo6cYUZL5gjihyPO35TUrvmgHOu4QQauwXuqDshqoZ7BON2vK/AZWyq/V
         nUTvW5XgJaUhF37QoMc6oZuHMJR7/0gBDmARfuf6MMHZgdUHZvNhyTtGVTH5YT/gF76P
         Q8UAS8+bYYIFuavPNnA+Ek0PUqTkkSrglfB32jAbviGfv/1jjDvDKWksxiWzTnPms2lR
         5U9K3chQKtm4QeY+6i33ATCsvhw2cU1hiHI17S6Yb9TKSxZ9Tz6O5zLTHG21u/RdUgFn
         XyaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=47+3q4k6Q3ZRJ82DMWLgHM9baB7pgYKThRa3GbcRo2c=;
        b=GbCpJTLGb9m33V/pi6hgzfTSszs+g+Kbu6w/9fn3cXg2cepAmD1angFFaNiZwNRwVZ
         aOh/IMzdbv1CWLaAoaJ+1Uind0tHY6sJ6mkgGWa4Yr0KuoJd1gwvN0bF1vJS6XttKRK+
         8kTpLbuNIF2B1+UZTbzCG2QrrD75lWk8QFf+9zNSjyCnHzleoFyueGmnIoPQlA5XRzKZ
         CdQOgISOREppCD9MjBtLjLry2GsdL0F74MxqWBa0XGK7QDM1Mb/mKDBkY1Ooa5puYNDo
         O28gA23b9RAvjMp3I39oMK4TTdgE/ektjabH1Ki3c2ZTfTj6+HJIVzEOw7LDrbmUnm26
         inww==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530LQAcJHrbzRpLqL9N0Mev0KGg4cXlOGzY1YSAY0pQ2j5qoZVOe
	EF2SFUtWC6BgR7DaJigo+3Q=
X-Google-Smtp-Source: ABdhPJwgH59Ker+pYcamv+Qf7Rjj0Yl4RoEDP82/hToHXwAaLxdb20XNCuSHonskDHCScCcl8gCvOg==
X-Received: by 2002:a17:907:366:: with SMTP id rs6mr2389287ejb.352.1603804850131;
        Tue, 27 Oct 2020 06:20:50 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:3189:: with SMTP id 9ls776358ejy.10.gmail; Tue, 27
 Oct 2020 06:20:48 -0700 (PDT)
X-Received: by 2002:a17:906:48c:: with SMTP id f12mr2505968eja.467.1603804848763;
        Tue, 27 Oct 2020 06:20:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603804848; cv=none;
        d=google.com; s=arc-20160816;
        b=pp4awteFLvmrD0pBWl0i2YZSq+cTxWbVO1e2tXLYCljBQonmh6mWWPfAcQGMuKbVJ3
         UnI906qkgwGWlr+yUnC/MwhrlrEjG+x9aivK8/UdXU8TsT5jsUPbBX4b0o0sIzMERYI2
         8HI9eeISBi1HYB+UFZQ5P2aDeG2Qrielskd3pCwY7aFrd33/gl/JNjDuRfFInwY+31o3
         AokIlkWn3kyhIm61af/oj52BqLSL48vtxbKs5UzDrauBbakLey6wy4JhpbQiuMxwGhux
         5LaZgcJihVgHeYSXxrwBQhNz40286dBYV+gxSX8Ht1+rIJfnffHu0QeODhZ/T6mBXFIb
         gMGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=qvf200LhVh6Hj+dVQ7Hd7iU/nOiWoATtmBasQCfgqvk=;
        b=mJKje6oMPd9SHj6GUMP8GyUkzcxETWeTB7ZrgmaCmkvl9LZRQxWMCLSovAOrCvwTt9
         E8RSJV9IXhbwQ2ln67wCdhe9lrqgnDXkU0+3mSnA3GpAkcYVEQ6DC84lSp3VsBUZ/3+D
         NlhlpRrhUquin98yxkbR6GC3RLoN52Afl2753VsCOp2BkSutn0FYbzb4NTXNf4lnqnux
         KhtZX2a26Mi16RKUEviZfhxMhhHcDJU5MlkNwzuGN0MNamTTKucooIZzzR2LJ9xJfkf4
         OX+rIaoTBIa/B5nqiXu9LIQmhq9NndwEvjANb67GTxyTbA0IhkhvPNZAkwnbUnAsLoRG
         iJbA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id n7si39450edy.3.2020.10.27.06.20.48
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Oct 2020 06:20:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 09RDKmNT009979
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 27 Oct 2020 14:20:48 +0100
Received: from [139.25.68.37] ([139.25.68.37])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 09RDKm5q006680;
	Tue, 27 Oct 2020 14:20:48 +0100
Subject: Re: [PATCH v2 20/33] arm64: smmu-v3: use uint instead of int when
 needed (Wsign-compare)
To: Andrea Bastoni <andrea.bastoni@tum.de>, jailhouse-dev@googlegroups.com
References: <20201022175826.199614-1-andrea.bastoni@tum.de>
 <20201022175826.199614-21-andrea.bastoni@tum.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <0159b84d-5805-ecc9-e66e-324d883ad15d@siemens.com>
Date: Tue, 27 Oct 2020 14:20:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201022175826.199614-21-andrea.bastoni@tum.de>
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

On 22.10.20 19:58, Andrea Bastoni wrote:
> Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
> ---
>  hypervisor/arch/arm64/smmu-v3.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/hypervisor/arch/arm64/smmu-v3.c b/hypervisor/arch/arm64/smmu-v3.c
> index 3b5117ba..1f83e389 100644
> --- a/hypervisor/arch/arm64/smmu-v3.c
> +++ b/hypervisor/arch/arm64/smmu-v3.c
> @@ -405,7 +405,7 @@ static void queue_inc_prod(struct arm_smmu_queue *q)
>  
>  static void queue_write(u64 *dst, u64 *src, u32 n_dwords)
>  {
> -	int i;
> +	u32 i;
>  
>  	for (i = 0; i < n_dwords; ++i)
>  		*dst++ = *src++;
> @@ -1044,7 +1044,8 @@ static int arm_smmuv3_cell_init(struct cell *cell)
>  {
>  	struct jailhouse_iommu *iommu;
>  	struct arm_smmu_cmdq_ent cmd;
> -	int ret, i, j, sid;
> +	int ret, sid;
> +	unsigned int i, j;
>  	struct arm_smmu_device *smmu = the_smmu;
>  
>  	if (!iommu_count_units())
> @@ -1074,7 +1075,8 @@ static void arm_smmuv3_cell_exit(struct cell *cell)
>  {
>  	struct jailhouse_iommu *iommu;
>  	struct arm_smmu_cmdq_ent cmd;
> -	int i, j, sid;
> +	int sid;
> +	unsigned int i, j;
>  	struct arm_smmu_device *smmu = the_smmu;
>  
>  	if (!iommu_count_units())
> @@ -1099,7 +1101,8 @@ static void arm_smmuv3_cell_exit(struct cell *cell)
>  static int arm_smmuv3_init(void)
>  {
>  	struct jailhouse_iommu *iommu;
> -	int ret, i;
> +	int ret;
> +	unsigned int i;
>  	struct arm_smmu_device *smmu = the_smmu;
>  
>  	iommu = &system_config->platform_info.iommu_units[0];
> 

Again, I would like to avoid calling an unsigned 'i', rather 'n' (like
we already do). 'j' could become 's' (stream), or stay 'j'.

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/0159b84d-5805-ecc9-e66e-324d883ad15d%40siemens.com.
