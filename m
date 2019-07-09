Return-Path: <jailhouse-dev+bncBDAIL6M7XMEBBJFGSLUQKGQEG24QEVQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x538.google.com (mail-ed1-x538.google.com [IPv6:2a00:1450:4864:20::538])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF3F63693
	for <lists+jailhouse-dev@lfdr.de>; Tue,  9 Jul 2019 15:14:12 +0200 (CEST)
Received: by mail-ed1-x538.google.com with SMTP id y15sf7630597edu.19
        for <lists+jailhouse-dev@lfdr.de>; Tue, 09 Jul 2019 06:14:12 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1562678052; cv=pass;
        d=google.com; s=arc-20160816;
        b=y2/Dvv31immTD1XR/kZAN8p4g3TsIbb4y3+I2O/5STJolJjAD9Y9zAKI6fMLupvXz/
         c6pTtwYy3ONL+NxJvDU80dy5XVZ39ije493GbqhY1+YGyaz1dh0Ll2CjhmaXxKVoS8FN
         8OoY1EKuNgb6p/n7JARkAoUaAGyrBSbQoarNhSJLd7teu+X+J1VRY7WbQ1JasqpliKEm
         24bjOaxI7CzZgSXyC93+19v0rV9A9jemd99RPZH3seE3jQGJYKWjzbSt95WpqPj5lAXR
         QTZ7pb0BfthDmlxYaJayk0KUOG8aGObtZ8Y9n28ukgxMacdgBewarU4qeBntkXrMCVgf
         jTVg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature:dkim-signature;
        bh=ELBKk24Yz0D47ShSSYIbM99G+thtfoGTcyg0B6xYRS0=;
        b=hc2fPpXsNrgsprkGmKUS2dnmy3hr9XRJFbl8m+qT13YMYTf4Z2Vx+ibzFDMfY//oMc
         WLO75ZV3Ynex4D98XclbJEGBVNHVCY5lUHdJRwz5XRQVW22RmmbmB2AvaYIPdZuksdGh
         NkhD4316+Mr0rc7o7AvYgZc87GCWkz3InmaZMPfWd8CS1LtLZ+QVE3LV3geW5qDZUhN2
         xZlKg5GCtLelC1rMqHHGTVBiDc+lGcLhFdwhaGmcbbEZ0BGbcd3BsFd4FxsIWuIY6DDi
         U+5iHsDLI+VH2ETd2sWPExpRuEl0v2fAtzskqP0NtG3BOWSI9EwacCHkXJJ1XmaxK2H9
         4RtA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=joS8zn39;
       spf=pass (google.com: domain of jphilippe.brucker@gmail.com designates 2a00:1450:4864:20::443 as permitted sender) smtp.mailfrom=jphilippe.brucker@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=ELBKk24Yz0D47ShSSYIbM99G+thtfoGTcyg0B6xYRS0=;
        b=ZTaCUgxDurpqHpYCoNovf4TYdbUMqDPOzMe15Bt22ts21l4J8ASVQeZJlSAmbK03rW
         bJ1G64M5o5srfhutKGugFw6WlJ/kThbW0G2psoDmBSSyMzG8+l/AOwOv7BeUDgzsOCq/
         W0cq2iqF+0GyQDAuwtzfYGoTlepqPLAGwF6kAK5otAKkFLmRWBqJHboBIvsKWEYQL1YI
         b9QqURIyVr9RTPHHCGsiUKR4bBJuF/x0vud04U0TeXIBi4Z1iWtu5NkGcCtVd5uv9PCN
         6VtGbrgAI4u8uiJBtaduimOlgo2kTqHMzmv+tQ1JtogT2Tiv2eQs29REZA7WA+pyrD55
         XuQw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=ELBKk24Yz0D47ShSSYIbM99G+thtfoGTcyg0B6xYRS0=;
        b=t431vy8m70yIwNMogOHMDVp2+dDAD4wG10fs/7l3JB6b5Fg8g/aSLMLjizPofvStDb
         baB/gbnVizj50kqvNrn9prQjMF7yxTUuwNHlQ+hlpoV+gyKqWPvQIhNByIASguRdU4ut
         iEoFMUT5mHp5nFqoDRInHEzWPhpjHkYoscEW/Uq74VM2rJMJLEFgB0iupqK4DF8Izqv+
         7J4R5VQtzvypSpEac9MN7N0HY/A1bYS2WsKHZ0giXS77Fc3Ib4aQMLO1qE43Agu5nYes
         M/0A5IPksNUoHmcSKcwtY8HHyHKmFmCdFo1M+0weYSUb5fUWz7dVedEtNyuPW+e9JYnQ
         mAGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=ELBKk24Yz0D47ShSSYIbM99G+thtfoGTcyg0B6xYRS0=;
        b=NLnJ69kWfn0nWcxBxPR8Gb/0YgKiQSF1w1ZpFJYt2ErbS6ApLxDP8Ort+G6azjaD5i
         AYl12tRK/ERIx9IgDiMFimqRxmiqvML8mJgpXTyDUIrvhQrTBhgNkDGe2ld0bFECXRq3
         RrgLvPBt+heYgWRQ7qcXA2Su6PAv113JrdThtxi6iux91UVgv97rh/cD55H2fL6tTPX7
         5ASnFh9JkXZhhtKkZMoYsrOhWCCGMZWet2Xp5UO3k77hpahSzzQNLFRSItcW7L6zHlA/
         2LszhA2zBZ9bBIr5uA3YjiepYB1Hwv42VvlbYLFy1KKukZJ49IEHAUbNKXp2d/Aqzpdg
         SDOA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXbZfXi9QIHKHcbY4meIme5GVgScWGRVmmKGcSsX+G46/v0VP5Y
	UqXyynifRQiTpHJGhIbccWY=
X-Google-Smtp-Source: APXvYqyKRrSw0rwMeWhYgEuSYEfpIU1u6mXrH775BjUic0ubhCS0bFU3h3RyrhBx9XDyzaW8woPeKw==
X-Received: by 2002:a50:92fc:: with SMTP id l57mr25678008eda.206.1562678052481;
        Tue, 09 Jul 2019 06:14:12 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:5791:: with SMTP id k17ls4751599ejq.5.gmail; Tue, 09
 Jul 2019 06:14:11 -0700 (PDT)
X-Received: by 2002:a17:907:217c:: with SMTP id rl28mr21217517ejb.131.1562678051553;
        Tue, 09 Jul 2019 06:14:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562678051; cv=none;
        d=google.com; s=arc-20160816;
        b=cW9U2RJsLCy4ir8qzw+fXdu1sYCe5INgDo7EU93n4TzY5HpZGFiSloZh1jeEA2tYPX
         cqmBNelbqw79c3gFCAZUGD0GKLwXutpZUruxXO9PjK/jGeyroJzB+CoqSm8XlXlqcpmQ
         sCgprMqxY4gEHUe0zzLQ0T+ezGlnOxlenu5LBeagNQ10v51AnYNdzn2j5R8UKMd4WspC
         Voeg7ArXrWWSiW4R9ZzHyqjHQYL4wYo19fcA+iyATWhdgiAOBEBz525d5JqLWjm5rKNJ
         TXNaRbRdJb56iN/iN63jkGWVCEwbk5CflXHlmrXo774m5vHDW+48hn/SVEvOG8eYfv38
         V69g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=RdvYfsqCZvjjSYXGdT7GZ9cqzHvpe8aVF9+6V96SDzc=;
        b=M3O83HPr5Q4jGp6vzFQCLT0csQ4JYwrvBZcp4ksyDIgj89P4lVxYZh2jLNNNBcSe4g
         KerxNl2zJyFbNkU3bD62b5DFavUAHXk/eY1boJ4Jpy3sVvaEm1Ne2rzC6HjaHiEBiiO0
         Ksl+pIy3MYFnYmdZH+CEfC+IWi0KasNNuQDaGgTBxxhGIda84oTGjsvMZNiugSK+J6/5
         gdkf032xsaOCB74JsQNSXEL7aB6/873eixeAY/q0lv31EHQ29rd9hNEntNSCGLmgqQy2
         cF6//65gYezgmbV35exKxPT3/tt5poMFh/pX6Py0Tl4JvKFXSOeTFa0OadoEZpSJatbQ
         cJwQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=joS8zn39;
       spf=pass (google.com: domain of jphilippe.brucker@gmail.com designates 2a00:1450:4864:20::443 as permitted sender) smtp.mailfrom=jphilippe.brucker@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com. [2a00:1450:4864:20::443])
        by gmr-mx.google.com with ESMTPS id 91si674225edq.3.2019.07.09.06.14.11
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Tue, 09 Jul 2019 06:14:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of jphilippe.brucker@gmail.com designates 2a00:1450:4864:20::443 as permitted sender) client-ip=2a00:1450:4864:20::443;
Received: by mail-wr1-x443.google.com with SMTP id 31so4203129wrm.1
        for <jailhouse-dev@googlegroups.com>; Tue, 09 Jul 2019 06:14:11 -0700 (PDT)
X-Received: by 2002:adf:e6c5:: with SMTP id y5mr26349094wrm.235.1562678051219;
        Tue, 09 Jul 2019 06:14:11 -0700 (PDT)
Received: from [192.168.0.5] (cpc92304-cmbg19-2-0-cust820.5-4.cable.virginm.net. [82.24.199.53])
        by smtp.gmail.com with ESMTPSA id h9sm17078720wrw.85.2019.07.09.06.14.09
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Tue, 09 Jul 2019 06:14:10 -0700 (PDT)
Subject: Re: [PATCH v2 5/6] arm64: iommu: smmu-v3: Add data structure
 initialization and stage 2 for SMMUv3
To: Pratyush Yadav <p-yadav1@ti.com>, jailhouse-dev@googlegroups.com,
 Jan Kiszka <jan.kiszka@siemens.com>
Cc: Lokesh Vutla <lokeshvutla@ti.com>, Sekhar Nori <nsekhar@ti.com>,
 William Mills <wmills@ti.com>, Nikhil Devshatwar <nikhil.nd@ti.com>
References: <20190705144225.7126-1-p-yadav1@ti.com>
 <20190705144225.7126-6-p-yadav1@ti.com>
 <d06d6e44-ec75-947c-c45a-0c36c5f63af6@gmail.com>
 <1034733d-6a9a-9949-4a52-f6a4722bdeec@ti.com>
From: Jean-philippe Brucker <jphilippe.brucker@gmail.com>
Message-ID: <19cd101c-13c8-c008-539d-ca7dfa959ac2@gmail.com>
Date: Tue, 9 Jul 2019 14:14:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <1034733d-6a9a-9949-4a52-f6a4722bdeec@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jphilippe.brucker@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=joS8zn39;       spf=pass
 (google.com: domain of jphilippe.brucker@gmail.com designates
 2a00:1450:4864:20::443 as permitted sender) smtp.mailfrom=jphilippe.brucker@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

On 09/07/2019 09:25, Pratyush Yadav wrote:
>>> +static int queue_insert_raw(struct arm_smmu_queue *q, __u64 *ent)
>>> +{
>>> +	while (queue_full(q))
>>> +	{}
>>
>> It seems like queue_full() only accesses the shadow version of cons and
>> prod, so I think you need a queue_sync_cons() in this loop. But given that
>> you drain the queue for each command below, queue_full() could only happen
>> if the queue is in error state, in which case this will loop indefinitely.
> 
> I'll sync the consumer in the body of the loop, just in case there is a
> change in the future that doesn't drain the queue.
> 
> Also, why would queue_full() happen when the queue is in error state? In
> that function, we don't check the error code, only the write index and
> wrap. AFAIK, neither of those are affected when an error is active.
> 
> So we should also add queue_error() check here, correct?

Yes I think so, and return early if queue_error(). If you keep adding new
commands while the the queue is in error state, then the SMMU never
updates cons and you'll end up being stuck with queue_full() in the above
loop, at some point.

>>> +
>>> +	queue_write(queue_entry(q), ent, q->ent_dwords);
>>> +	queue_inc_prod(q);
>>> +	while (!queue_empty(q) && !queue_error(q)) {
>>> +		queue_sync_cons(q);
>>> +	}
>>> +	return 0;
>>> +}
[...]
>>> +		/*
>>> +		 * Commands are written little-endian, but we want the SMMU to
>>> +		 * receive MSIData, and thus write it back to memory, in CPU
>>> +		 * byte order, so big-endian needs an extra byteswap here.
>>> +		 */
>>
>> The comment doesn't apply anymore, does it?
> 
> Why not? I'm guessing it's because the driver is written with the
> assumption it is running on a little endian core.
> 
> In that case, yes, it does not apply. This was taken verbatim from the
> Linux driver, so probably why this comment stayed around.

Yes I think the comment applied to cpu_to_le32(ent->sync.msidata) in the
Linux driver

> 
>>> +		cmd[0] |= FIELD_PREP(CMDQ_SYNC_0_MSIDATA, ent->sync.msidata);
>>> +		cmd[1] |= ent->sync.msiaddr & CMDQ_SYNC_1_MSIADDR_MASK;
>>> +		break;
>>> +	default:
>>> +		return -ENOENT;
>>> +	}
>>> +
>>> +	return 0;
>>> +}
[...]
>>> +static void arm_smmu_sync_ste_for_sid(struct arm_smmu_device *smmu, u32 sid)
>>> +{
>>> +	struct arm_smmu_cmdq_ent cmd = {
>>> +		.opcode	= CMDQ_OP_CFGI_STE,
>>> +		.cfgi	= {
>>> +			.sid	= sid,
>>> +			.leaf	= true,
>>
>> You probably need leaf = false, because the SMMU could cache l1 stream
>> table descriptors. I think the Linux driver gets away with it because it
>> only modifies l1 descriptors before making the stream table visible to the
>> SMMU through SMMU_STRTAB_BASE (I haven't verified that claim).
> 
> Hm, I don't think the Linux driver only modifies L1 descriptors before
> making the stream table visible to the SMMU.
> 
> arm_smmu_add_device() calls arm_smmu_init_l2_strtab() which modifies the
> L1 descriptor. Since a device can be added after the SMMU is
> initialised, the Linux driver makes changes to L1 descriptors after the
> SMMU is up and the stream table is visible.

Good point, I'll look at fixing this in the Linux driver

> 
> Either way, we should be invalidating the L1 descriptors when we
> actually update them. And the best place for that would be
> arm_smmu_write_strtab_l1_desc().
> 
> Unfortunately, I don't think there is a command to invalidate just a L1
> descriptor. So we'll probably have to hack around it by invalidating the
> first STE for the L1 descriptor with leaf = false.
> 
> Any better ideas?

No that's what I do when I want to invalidate a L1 context descriptor,
invalidate the first L2 descriptor with leaf = false.

> 
>>> +		},
>>> +	};
>>> +
>>> +	arm_smmu_cmdq_issue_cmd(smmu, &cmd);
>>> +	arm_smmu_cmdq_issue_sync(smmu);
>>> +}
>>> +
>>> +static void arm_smmu_write_strtab_ent(struct arm_smmu_device *smmu, u32 sid,
>>> +				      __u64 *guest_ste, __u64 *dst,
>>> +				      bool bypass, u32 vmid)
>>> +{
>>> +	struct paging_structures *pg_structs = &this_cell()->arch.mm;
>>> +	u64 val = dst[0], vttbr, mask;
>>> +
>>> +	/* Bypass */
>>> +	if (bypass) {
>>> +		dst[0] = STRTAB_STE_0_V;
>>
>> Hm, won't the "dst[0] = val" below clear V?
> 
> Yes it will. This probably got messed up in a bit of last-minute
> refactoring I did. Fixed.
> 
>> STE writes in this function might need a little more care. At this point
>> for example, the SMMU could issue C_BAD_STE events because the STE is
>> marked valid but is in inconsistent state. It might be best to do the same
>> as the Linux driver: ensure dst[0].V is clear, write dst[1-3] first, issue
>> a sync(), then write dst[0] in a single access.
> 
> All right. The next patch also touches this function. That will need
> fixing too.
> 
>>> +		dsb(ish);
>>> +		val = FIELD_PREP(STRTAB_STE_0_CFG, STRTAB_STE_0_CFG_BYPASS);
>>> +		dst[0] = val;
>>> +		dst[1] = FIELD_PREP(STRTAB_STE_1_SHCFG,
>>> +				    STRTAB_STE_1_SHCFG_INCOMING);
>>> +		dst[2] = vmid;
>>> +		dsb(ish);
>>> +		if (smmu) {
>>> +			arm_smmu_sync_ste_for_sid(smmu, sid);
>>> +		}
>>> +		return;
>>> +	}
>>> +
>>> +	dst[2] = FIELD_PREP(STRTAB_STE_2_S2VMID, vmid) |
>>
>> One more restriction on the hardware is that the VMID size used by the CPU
>> must be smaller or equal the size of the VMID supported by the SMMU. If
>> the CPU is using 16-bit VMID (TCR.VS == 1) but SMMU_IDR0.VMID16 == 0, then
>> setting the top VMID bits here is illegal.
> 
> We're pulling the VMID from cell->config->id, which is the cell id. This
> is a linearly allocated number, so you'd need at least 257 cells to set
> any of the top bits. In case of Jailhouse, that would mean at least 257
> CPUs. I don't think anyone is using Jailhouse with 256+ CPUs, so this is
> not a big problem for now.

Fair enough. Note that the ThunderX2 has 256 CPUs and an SMMUv3, so I
wouldn't be surprised to see 256+ in a few years. But such hardware is
likely to set VMID16 anyway.

> And say we do overflow. Say we do have more than 257 cells running. What
> do you set the VMID to then? You can't wrap the value back because that
> would conflict with another cell. The only course then would be to
> terminate the cell, or not use the SMMU for it at all.

It might still be a good idea to check that we have enough VMID bits here
and display an error if we don't.

> 
> Not using the SMMU could work, but it means there would be complications
> when the cell expects stage 1 translations.
> 
> Again, to me it looks like a problem that is not likely to occur. Jan,
> your thoughts about it?
> 
>>> +		 FIELD_PREP(STRTAB_STE_2_VTCR, VTCR_CELL) |
>>> +		 STRTAB_STE_2_S2PTW | STRTAB_STE_2_S2AA64 |
>>> +		 STRTAB_STE_2_S2R;
>>
>>> +
>>> +	vttbr = paging_hvirt2phys(pg_structs->root_table);
>>> +	dst[3] = vttbr & STRTAB_STE_3_S2TTB_MASK;
>>> +
>>> +	dst[0] |= FIELD_PREP(STRTAB_STE_0_CFG, STRTAB_STE_0_CFG_S2_TRANS);
>>> +	dst[0] |= STRTAB_STE_0_V;
>>
>> Here as well, it would be better to sync the rest of the STE, then write
>> dst[0] in a single access.
> 
> Will fix.
> 
>>> +	dsb(ish);
>>
>> Not sure that's needed, the Linux driver doesn't have a dsb() here
> 
> Why not? Do you not want to make sure the writes actually go through
> before you sync the STE?

Ah, I think in Linux we rely on the writel(cmdq.prod). It has a dsb(st)
which ensures that all writes are visible to the SMMU before we publish
the new command. If you added a dsb() in queue_inc_prod() I think you
could remove the other dsb() calls in ths patch.

> 
>>> +
>>> +	arm_smmu_sync_ste_for_sid(smmu, sid);
>>> +}
>> [...]
>>
>>> +static void arm_smmu_uninit_l2_strtab(struct arm_smmu_device *smmu, u32 sid)
>>> +{
>>> +	struct arm_smmu_strtab_cfg *cfg = &smmu->strtab_cfg;
>>> +	struct arm_smmu_strtab_l1_desc *desc;
>>> +	void *strtab;
>>> +	u32 size;
>>> +
>>> +	desc = &cfg->l1_desc[sid >> STRTAB_SPLIT];
>>> +
>>> +	desc->active_stes--;
>>> +	if (desc->active_stes)
>>> +		return;
>>> +
>>> +	size = 1 << (STRTAB_SPLIT + STRTAB_STE_DWORDS_BITS + 3);
>>> +	page_free(&mem_pool, desc->l2ptr, PAGES(size));
>>
>> Might be safer to free the page after clearing the l1_desc and issuing a
>> CMDQ_CFGI_STE? Here the SMMU can still access the page.
> 
> This function is only called during cell_exit(). Will the SMMU have any
> transactions while a cell is exiting?

The SMMU is allowed to access structures speculatively, as long as they
are reacheable (pointed to by valid descriptors). See 3.21.3 in the
specification:

"An implementation is permitted to fetch or prefetch any reachable
structure at any time, as long as the generated address lies within the
bounds of the table containing the structure. An implementation is
permitted to cache any successfully fetched or prefetched configuration
structure, whether marked as valid or not, in its entirety or partially."

So there is a possible use-after-free. Even though I think it's harmless
enough, it's still a good idea to only free the table after the invalidate.

> 
>>> +	desc->l2ptr = NULL;
>>> +	desc->l2ptr_dma = 0;
>>> +	desc->span = 0;
>>> +	strtab = &cfg->strtab[(sid >> STRTAB_SPLIT) * STRTAB_L1_DESC_DWORDS];
>>> +	arm_smmu_write_strtab_l1_desc(strtab, desc);
>>> +
>>> +	return;
>>
>> nit: not needed
> 
> Fixed.
> 
>> [...]
>>> +static int arm_smmuv3_cell_init(struct cell *cell)
>>> +{
>>> +	struct jailhouse_iommu *iommu;
>>> +	struct arm_smmu_cmdq_ent cmd;
>>> +	int ret, i, j, sid;
>>> +
>>> +	for (i = 0; i < JAILHOUSE_MAX_IOMMU_UNITS; i++) {
>>> +		iommu = &system_config->platform_info.arm.iommu_units[i];
>>> +		if (iommu->type != JAILHOUSE_IOMMU_SMMUV3)
>>> +			continue;
>>> +
>>> +		for_each_stream_id(sid, cell->config, j) {
>>> +			ret = arm_smmu_init_ste(&smmu[i], sid, cell->config->id);
>>> +			if (ret) {arch_paging_flush_page_tlbs
>>> +				printk("ERROR: SMMU INIT ste failed: sid = %d\n",
>>> +				       sid);
>>> +				return ret;
>>> +			}
>>> +		}
>>> +	}
>>> +
>>> +	cmd.opcode	= CMDQ_OP_TLBI_S12_VMALL;
>>> +	cmd.tlbi.vmid	= cell->config->id;
>>> +	arm_smmu_cmdq_issue_cmd(smmu, &cmd);
>>> +	arm_smmu_cmdq_issue_sync(smmu);
>>
>> By the way, shouldn't there be a CMDQ_OP_TLBI_S2_IPA whenever we do
>> arch_paging_flush_page_tlbs() on the CPU side?
> 
> I don't think so. Firstly, arch_paging_flush_page_tlbs() is called only
> for changes to hypervisor paging structs. Right now, the hypervisor does
> not use the SMMU at all. It is only for guest use.
> 
> And the guest memory mappings are static and will remain constant from
> start till exit. So we should only need to flush these entries when
> starting a cell (which we do), and when exiting a cell.

Ok

> This makes me realise, we should be calling CMDQ_OP_TLBI_S12_VMALL on
> cell_exit() too.

Yes I think that would be better.

Thanks,
Jean

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/19cd101c-13c8-c008-539d-ca7dfa959ac2%40gmail.com.
For more options, visit https://groups.google.com/d/optout.
