Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBCUUT7VAKGQEQIL4KKQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33d.google.com (mail-wm1-x33d.google.com [IPv6:2a00:1450:4864:20::33d])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C7D81223
	for <lists+jailhouse-dev@lfdr.de>; Mon,  5 Aug 2019 08:17:47 +0200 (CEST)
Received: by mail-wm1-x33d.google.com with SMTP id z24sf14634795wmi.9
        for <lists+jailhouse-dev@lfdr.de>; Sun, 04 Aug 2019 23:17:47 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1564985866; cv=pass;
        d=google.com; s=arc-20160816;
        b=LE0i003wn2z7hhE4FcdUex42rufb+rAg0NVYkyMtioTcvuwLpQK+0PxqP2nwYt48+M
         7DzYjJewQU2wmhAtBqkA+POd0N2siggt3uPWj5Zomj8QtAw/00Q2HLVy/g3oHDOnGCu3
         n4PLfNc+wgNb289sr3vdPjHRBBLur+CUWeAduwVTw/u/WyE/1V6tCamzuPJf7XW/jJis
         wskN4JEHL2xX6qdodc/lhT03PBejjufRlBMhwW1y68MXXr/NihcWInquCCCQDZM5RQLI
         +IGA3JBhuwIWjv63eUHhSXCsgFgYywfcGxGNWfxdAWdj+bGj3MknBPzNboTWaChzoYVL
         6FsA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=I6Cc8Iu+79XGyArpcgS0IpLTVBAXjLM5brdGeUqnAzo=;
        b=oTh18A6Cwx0/XIhpK+8845OCQ5StCwNF22ZVMKDFvJWetK1rdPHiPpV47k4/j37n6O
         tNi8cOps6v5P3mvyaUKoXJ09bVDZEdt/wcDOOdm3iP/W+BeAvUcmHwr1PKR2JvPBAn9z
         vnKhC2750VAA3t3wJ5J1Q//lihWKNEARiO1AXCb5KOE1luNu1Z8lu6aIArm9pN566ZYx
         I3Ed7xW3ZUpy4CjYDRQ6HLjCxfD0IDJEC3otMra33JA4aX+9kJ00UT+QaN3ekxm2RK0C
         PueuJeOsohO5k0AbpUecqzrk2barftrUp7st9BDv7DjMonIXNneLKTwCwCXM+sMIWdUn
         1x5w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=I6Cc8Iu+79XGyArpcgS0IpLTVBAXjLM5brdGeUqnAzo=;
        b=hSxy033HcVvUMXF7l7Ir5q8ZBLaJ77z+OJ66qIPnwHCOswDYtYV/TyLInAhQRXgFJj
         wiMbm/AEcyet6B6nrdQCVEcIsGNi+rdcANaoCHItrKIKrGW51deBvKsloLehtdvGjU0z
         tNY9vrLCrDntnPYRk0VM4IE9oZiWx6VRzfQcq8DoTC25uh0luCeZKlUNWDIDYImty1HE
         HAA4AguMWuCCvz0KEzvHDL/piJcrl+mSPYFLeMxPdgxhHPOLLfsLWoV2z6CJLeVUaxbq
         t9FfxHB3eT+muBwySR0IVTqSgsYe0qfQxVSN+zJW1SJWmhVXwfHYwmjiAdgX0xWkUMrj
         dsew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=I6Cc8Iu+79XGyArpcgS0IpLTVBAXjLM5brdGeUqnAzo=;
        b=kx2zJGNN1lV6hPa3k3nlibzM7aGS86PGqzjk0N5oe1f+1d+Fx/LP9CsZlcWBF7zjn+
         KOdfbVZn2+g9IAAfCMk2njV+mzHhSodtrLJHBnuPc/+caeU7ab/hYXpDWyx+bwyZAx7t
         vmfsWyj64/seRcuEd38Mp/mdsw/8Q+XBMpeeWdEqnJPvWAvq8jPh31RYNa3XOPvcgY7q
         MGodCv5uRKuMppl+gR4b07rDFBMfNBRsRtjBg6UEdTZJtvjOsu0kz3ws1m1jvZmq4j84
         1wHAyM7G7hafdMU4lkVH26PMnQmnYcqDlkrkPq+WqD0HnuGx5iHs2K13OC5v5oI31nXl
         91PA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWHpZLXJk9wBeS9fAFcEQKZMhd5ELcwSS8cnirBlcOOrCcYS7Yk
	eSLgkqHrcODHoveJeVInNe4=
X-Google-Smtp-Source: APXvYqzQx3vwQT07+Dfs80WHSxWL0VZTMYgXaT6uPIF2+oqz55BjG0Dgix1xmZOuaowT2g+JD1T/Qw==
X-Received: by 2002:a5d:498a:: with SMTP id r10mr72098645wrq.28.1564985866742;
        Sun, 04 Aug 2019 23:17:46 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:9321:: with SMTP id 30ls24278127wro.1.gmail; Sun, 04 Aug
 2019 23:17:46 -0700 (PDT)
X-Received: by 2002:adf:cd04:: with SMTP id w4mr112440314wrm.230.1564985866098;
        Sun, 04 Aug 2019 23:17:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564985866; cv=none;
        d=google.com; s=arc-20160816;
        b=BmAXwldVvE3rHybmy7wA0PgIPhzGM93+sCpCWciHzU8thVoPQG5hdyzlknsqd1JAN9
         eM0I6ZamIVMO6nESQT3v076Zy2Wc+8KySaAG1Hwdrvy1NwZ6SHmSQV72YWwz8GuLFvKP
         6SBb+YBYIOu+74jPIJW7wNMmDewcvMLR1ktNRoDt1/+0d64VeIiVEkEaal6Llp5QzvDg
         vC3mL6MlcKdC+aww9WtxdsmhnTuwHuygkjKGHrnmBxHrJxhP0ICbgMo6inkyP1cQJ2oF
         EHmP6+m2jtF7Qu/3PMh7zQlZQcOtSCLJxqIdWYQ/MjwwxNCqUVhPZ06r0ajOEH+Xx1j7
         FjQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=Nq7loLeLSZSYXaqOUqjnawflRfmQ4IehsaDTAHtgdfk=;
        b=G5NhCxkLs45fVB7N5xnq6aFehMVi8yUwebchW3eF5MuUxjZ92CUgraF4/r+U14MtWz
         49dqqyDqiH026xR+usPRvltrWBmggea03Gg3r95YTVjQD8RSPXl7C4gD8048QmT/GrhE
         m4Hhs1x6z6jo8hDaZKyRk8Ddz9LI5PJ4baUKrb85eRT0drqHYw/oY1YCG5ZwjPEGxwv5
         OGC2rAMX7i/RxQql88Jo6y8BmMK0tOXYI2+dC5oGBf8DI5Y76Wa4zYQJ3V66hNCRiFEt
         BJC1aJtPia/Km3qDJzizmMjys0Bz8bUQQYiaDfhtvAHpZlvt4bkXdCUbmr3gNnzFuO58
         raag==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id p4si2830963wme.2.2019.08.04.23.17.46
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 04 Aug 2019 23:17:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id x756HjBE026860
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 5 Aug 2019 08:17:45 +0200
Received: from [167.87.3.96] ([167.87.3.96])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x756HiaP018469;
	Mon, 5 Aug 2019 08:17:44 +0200
Subject: Re: [PATCH v4 5/6] arm64: iommu: smmu-v3: Add data structure
 initialization and stage 2 for SMMUv3
To: Lokesh Vutla <lokeshvutla@ti.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
Cc: Tero Kristo <t-kristo@ti.com>, Sekhar Nori <nsekhar@ti.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>
References: <20190801112648.6569-1-lokeshvutla@ti.com>
 <20190801113547.7460-1-lokeshvutla@ti.com>
 <4106eb52-b73f-cb70-bb85-ce7b1a882e11@ti.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <93b8b999-29a7-7ecd-4efb-c7a7454ad166@siemens.com>
Date: Mon, 5 Aug 2019 08:17:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <4106eb52-b73f-cb70-bb85-ce7b1a882e11@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
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

On 05.08.19 07:53, Lokesh Vutla wrote:
> Hi Jan,
> 
> [..snip..]
> 
>> +static int arm_smmuv3_cell_init(struct cell *cell)
>> +{
>> +	struct jailhouse_iommu *iommu;
>> +	struct arm_smmu_cmdq_ent cmd;
>> +	int ret, i, j, sid;
>> +
>> +	if (!iommu_count_units())
>> +		return 0;
>> +
>> +	iommu = &system_config->platform_info.arm.iommu_units[0];
>> +	for (i = 0; i < iommu_count_units(); iommu++, i++) {
>> +		if (iommu->type != JAILHOUSE_IOMMU_SMMUV3)
>> +			continue;
>> +
>> +		for_each_stream_id(sid, cell->config, j) {
>> +			ret = arm_smmu_init_ste(&smmu[i], sid, cell->config->id);
>> +			if (ret)
>> +				return ret;
>> +		}
>> +	}
>> +
>> +	cmd.opcode	= CMDQ_OP_TLBI_S12_VMALL;
>> +	cmd.tlbi.vmid	= cell->config->id;
>> +	arm_smmu_cmdq_issue_cmd(smmu, &cmd);
>> +	arm_smmu_cmdq_issue_sync(smmu);
>> +
>> +	return 0;
>> +}
>> +
>> +static void arm_smmuv3_cell_exit(struct cell *cell)
>> +{
>> +	struct jailhouse_iommu *iommu;
>> +	struct arm_smmu_cmdq_ent cmd;
>> +	int i, j, sid;
>> +
> 
> I missed the check for iommu_counts here. Can you take care while pushing or do
> you want me to re post the series?
> 
> 	if (!iommu_count_units())
> 		return 0;
> 

Just folded in and force-pushed to next.

Thanks,
Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/93b8b999-29a7-7ecd-4efb-c7a7454ad166%40siemens.com.
