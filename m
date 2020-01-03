Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBDPFXXYAKGQESHYG7FQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33c.google.com (mail-wm1-x33c.google.com [IPv6:2a00:1450:4864:20::33c])
	by mail.lfdr.de (Postfix) with ESMTPS id 8751612FAF9
	for <lists+jailhouse-dev@lfdr.de>; Fri,  3 Jan 2020 17:57:49 +0100 (CET)
Received: by mail-wm1-x33c.google.com with SMTP id c4sf1588897wmb.8
        for <lists+jailhouse-dev@lfdr.de>; Fri, 03 Jan 2020 08:57:49 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578070669; cv=pass;
        d=google.com; s=arc-20160816;
        b=xdrlCK4EkVk6zlk9z4X55KZDQE0TooeY74TDBRPhxvgm+4GzT/+joOfXg4ZcWWgxS0
         pJPlWSzeuMi7k++gdFjjUFx03e+gOGjCjfaU/jnDHw3936RiKYGkjLvvHJx8OIX5WahG
         DvKMO+IMAED1N288QZd+RHOjIdt/xWrV6wFLp3GiaAOWi7Ph4lnzWyup6Tf4UXYcq8rU
         J/78Zc+bqKaHAwY8KwUaaqVphyZOQ165Y1sCTzExMLqUHmUrLhWBzXkeu+OYBXOo76gM
         5ix09PfDygFZZzJh3dyNBu/UWHFmJVUlM5xtNDLWCGqDkFkXl4Xo/6s9RTkWLHXbz2U5
         O9lw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=B93frmJbm3nWfz8JNNPkZ9p+/4jX53ltH7MBJkBSJ8I=;
        b=GKIBI/OxyYmqrY561lVhkJHHb0g6wsdVB/eVhqseDmpCZOsdeAiwX5xPiNmN0n9N/y
         3KBJOxyRwc3CRuqQIknmwH6CyhUt81r5UH3Gkmt2fGzUSSiIfN/TAg/ITi40RVINl1c0
         tZzpd940ZYOE92FxrFzH7nJLP1ngQPbGJ5tU/uSYc9W1WIaBc9eNjYNI6ktCQyzCUBsm
         vGh4yrQwHzTIdfcPPyuQitPglyGCs0F70coFiYh4CAIbCnkIbaOhrVfb5qe5sKUm42rA
         A+bGsw6AsqmijV/aEAwGBIeXH3/wiSyHouDEeaOCvP7gnUIrDM5OtNlTl0XSU1Am6Hih
         3JoA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=QGIdzuY1;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=B93frmJbm3nWfz8JNNPkZ9p+/4jX53ltH7MBJkBSJ8I=;
        b=o1juv9ZORvYKNfhJaYUsFivYuULDu1cVH/kyuJv9VD9SdfjColECA5s9b6TuDSETFA
         1mCuiNoL62MP2qobmv+cm5uUqScY9vqYT1bC3MyUH0nTq+HKQYS1kOhgSEir7tNcU3CZ
         xEGqrMzcM+rE/xrn0JhbH0/tWhbz9aivvj+vfW51BDG0MiJzsZnBud5vdaYoTJi/A6iU
         +s9d7IDTKjdLFv9ZEWVq4MO08uiWTvOFCPTACebIACKhd4piTMH6GfrZgqGefiJ5XidG
         XoHoaoVGUrM91hWKXD8LKSaTjsCkqjvLB6+Z7Jw682tgOYLT9rP3Ph78x7CpvxgUhbdr
         ELow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=B93frmJbm3nWfz8JNNPkZ9p+/4jX53ltH7MBJkBSJ8I=;
        b=Wu2zI4HWmhISLxguksYjU5VoYFFY/Bw2P3CE2xtSS11QB0hQNDSzK0lD6mZ/hpiMjC
         PfMBpXJkSuWjhemiyx5vg/qcBNKxudRTyxlISpZAoip3bH35L6mZFKyYm2edQeLUDJ7X
         63HsnsZd4tabyoxZL2gES1+POELKip2+ANyBPQfTMYJf88KZMyubTp3pAGGnbp8lRtCr
         bXHkQLM6N0JeNRGejwBG0x448GBQhpaJ16/GbpGD4TkZgUdDRo1Xm2+Q7RGq9GwvTdAQ
         xAx5qgCYlB8HwdwFnAIdoB6aPCAuyYRPQghxIQHuxifsDwtVHpnS20u7azSsCpQFLTor
         HVoA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUcPUkTTmRNy87aAGL22D5Kr/WZshmFXX5EQcsfI/x88Vn2dt1g
	Axdgwjsbq9gVR7QkpD1QHDk=
X-Google-Smtp-Source: APXvYqyClM9T6Eh8gAx7P8liGMgN7fRPP4rMW8GXT80l3aCkKyaXQFNaSi4zSolgx5QdpM5lWh7JQw==
X-Received: by 2002:a05:600c:30a:: with SMTP id q10mr19914792wmd.84.1578070669221;
        Fri, 03 Jan 2020 08:57:49 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:6650:: with SMTP id f16ls11111956wrw.4.gmail; Fri, 03
 Jan 2020 08:57:48 -0800 (PST)
X-Received: by 2002:a5d:4692:: with SMTP id u18mr87958769wrq.206.1578070668623;
        Fri, 03 Jan 2020 08:57:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578070668; cv=none;
        d=google.com; s=arc-20160816;
        b=036NhHDKd/FJLYyr6EUPcFAxprc9GFfil8611759kWDFcivvR+mzsS3AfsiB0Jtzzr
         HS/jsSd0Wji3e7hLSjKdnYQnA3Vqcog14SJx5z6VV6aMdaGQtGTgZlUotAMZ/0AqDPn4
         iYtOlIsNv00D8K5rNZQkDJlYvnZjNN8QwpfivJKpYvr6rugAr5p4b2HOgNV97xA/jxVk
         x8v9CIxs2klWeTbbRB3WeC0nHooBSF42VhsJIXHejHUv0TtGC0B5vN38oQ1teZ8ZIkp9
         AcN9R06irqg85KZZBTnpSUAHFNu+k1JT5a1HqXm7O14puNUK2tL4DJTxZKIfGeB316TT
         XvvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=63XGmErdxZmsA51XbEZ4GNK78RGfviegJ2zj3RqlUxc=;
        b=ySMaeugHZUqcZJiKk0zwgany0BKVjUpVePbuy1cTyKDfrJdLVex04rQKol/Z2q+61u
         BpCTHsSP9ErDO5RnCc6DjtcSW1BYnk/FSfveErp8JM+VI0Dt7nmHXhpM8JGFSCKVF2Nt
         WjDhM4GFk9I8OAZ2pbOuGR0nCLxFlmA9nSOOXG6u8z+OnuyhczwXiu1N88jc2HuV1Ns3
         9TPqHmwhLQ8ZGGPNg8To0fQzU6DhAO7SOuLHBAZj30dd48QXqjsrkFjmcKmkBILl5fr+
         nsfrrvyVWDVsL4qcRq2037eJeZDKTcj8GZETFMXGwALA7O4/zfp4a8qCHqSE9oPpEHKh
         tqlw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=QGIdzuY1;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.3])
        by gmr-mx.google.com with ESMTPS id m2si607166wmi.3.2020.01.03.08.57.48
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2020 08:57:48 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) client-ip=212.227.15.3;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.55.156]) by smtp.web.de (mrweb003
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0LdVty-1jUyEL4AZW-00in92; Fri, 03
 Jan 2020 17:57:48 +0100
Subject: Re: [PATCH v1 2/4] arm64: smmu-v3: Fix crash when first iommu is not
 SMMUV3
To: Nikhil Devshatwar <nikhil.nd@ti.com>, jailhouse-dev@googlegroups.com
Cc: lokeshvutla@ti.com
References: <20191230132406.19985-1-nikhil.nd@ti.com>
 <20191230132406.19985-3-nikhil.nd@ti.com>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <206d0597-b45b-617a-019a-e80e06b18d2d@web.de>
Date: Fri, 3 Jan 2020 17:57:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191230132406.19985-3-nikhil.nd@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Provags-ID: V03:K1:fcIrt9MRWIv2BrKYKpkNYjosW4cXtxdzMD3xZZ7nwm+ttt6nzQ0
 d7zCNHIY17XfLWdMV3zI914otXb4SY5lcasCznIGJaCGDZ1x+VD4m2Vgst04zKJYsg2++vZ
 iHpEUdXXp7Acxi5GpW/+ZYU8URToDqXxMtu0JI5lXq9O3RiyEy4rAZUix1v/u38cT53D1yh
 5gy1AZIw1xNyiy90wS6wg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:PDMXkC+Xr9s=:3wPWpxDdv8aUxM1L8vGJOf
 g/4jnqCPA3QBPj6InnKQfxBIq5qWAwg6MONU+rkHWQjfmG0yYmQlKUCgSsSmPwScIzNWEkZqv
 P0HeiP/VLmQE2AUBHUGSxVujjXoGp2JSnsBJ78AC31b9skS9CMKwSZrStvnQHaQNn0g7655zl
 gn9roxyhk7s3kWxH3UeIUBSegWCJVDiwiD4uAa6q/CrSQgsSdxsojvnuplsIoU5k+YgpUBoY3
 8JWegRMHzwq6CAgrZxtAveZWN6F+02zXk+MhaX0XToort7eTRsIQStjRlLJXjpVtVv1RT0bvQ
 Wlpmi2bjbfBcAscD4nrSSQ21n4Bc36jaeXTBcM3rsOLV3SqqjkjejXDQZSdyLbc6WFLB/Rgif
 86K4Xpnr0fGBUM8N7GLHhlbPQ92aWgGa+9dXjV4PapiwUNl6gapnmHHV0L5hIHkCR6duyVjGf
 Yhrm5cSmbJynSWwSwhSsYy8QSDmAap4YMrt14mV4gpWizRbcIsan2ifIzE5u1NLPCNE11mk5C
 l/hECBYwr8hJszRaZAP9Ev/0yxFEdoPtfrrp6ojSgLTIcoKukYv6jTd3uBrhPDPqXI1lwTpYN
 xa5Ucf1LS2fJtVoFfuM9sv1D82K8AC1yl5KUuh4DQtKlKlpDrgJzKyvE726dp+AKP2y4jy3ub
 xqNCLT1m0QGiLi96Glpug/pE2zn0tJB92/SPmkyDx3brGQMNxGhvWg9V65lqYyRlU+HBwYNl/
 DWzZWnl1k1J9I0TLymS8zXT9XCuz+iGi0MyDH/qXKP81ZzNlMEFf1tuzYgsxMGNoF/95aKk5j
 YHF1z3O4jV4mfIpOFzyfSYRnySHJL1gcLtD9EW7/9ZsW4xpij1747Q2636fa0Cmah/reCUoYp
 wPP+0KXfDuf9c9Bx4pR3BgFEGtrW9stiwjRHwW5SUUBzYTU9cKDvar7bTZriSluSmxS8w7GfH
 UYqpESh2nWX11rtPav7QO4SDDsq9S9nsIzHttGyTDhamXFEAHN1c4xDhKGuze3cEFkepIweQp
 Z9Rs63chc9/BKuhtrDbpKdzixoTXob1aV8HuB5T/yaPHJRSygRyKvJyFQBxp23d/9YJZIrWZp
 1avJXfyMXvhriT06513XoeLcWbtQsH5cxSopQSLx4iAu9WKAM7apPq5gNilTAWM660CJfIZH2
 1lAgrDo4RziO7+VSY/hc/zE5XhIaY8kKkoENzRLCPPIrI1Vrg3+vQzDLAw1idYBSYRZt/gzgS
 6sIRHYOD+o3o539zF/4Zpi547SL3IWSBqp4OnHhtmXaakai5tjztJxzi1L7s=
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=QGIdzuY1;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted
 sender) smtp.mailfrom=jan.kiszka@web.de
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

On 30.12.19 14:24, 'Nikhil Devshatwar' via Jailhouse wrote:
> arm_smmuv3_cell_init and arm_smmuv3_cell_exit calls iterate over all
> iommu_units to process the ones with SMMUV3 type.
>
> After the loop, it unconditionally issues commands with first element
> of smmu. This causes Unhandled HYP exception  while enabling jailhouse.

Even worse, it would fail to issue those commands on the second and
following units, no? This should be reflected in the subject and commit
message as it seems to fix that case as well.

>
> Fix this by issuing the sync command only if the iommu is SMMUV3 type.
>

Looks like this should come before patch 1 then.

> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> ---
>   hypervisor/arch/arm64/smmu-v3.c | 20 ++++++++++----------
>   1 file changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/hypervisor/arch/arm64/smmu-v3.c b/hypervisor/arch/arm64/smmu-v3.c
> index dd33bda2..3889d32b 100644
> --- a/hypervisor/arch/arm64/smmu-v3.c
> +++ b/hypervisor/arch/arm64/smmu-v3.c
> @@ -1057,12 +1057,12 @@ static int arm_smmuv3_cell_init(struct cell *cell)
>   			if (ret)
>   				return ret;
>   		}
> -	}
>
> -	cmd.opcode	= CMDQ_OP_TLBI_S12_VMALL;
> -	cmd.tlbi.vmid	= cell->config->id;
> -	arm_smmu_cmdq_issue_cmd(smmu, &cmd);
> -	arm_smmu_cmdq_issue_sync(smmu);
> +		cmd.opcode	= CMDQ_OP_TLBI_S12_VMALL;
> +		cmd.tlbi.vmid	= cell->config->id;
> +		arm_smmu_cmdq_issue_cmd(&smmu[i], &cmd);
> +		arm_smmu_cmdq_issue_sync(&smmu[i]);
> +	}
>
>   	return 0;
>   }
> @@ -1084,12 +1084,12 @@ static void arm_smmuv3_cell_exit(struct cell *cell)
>   		for_each_stream_id(sid, cell->config, j) {
>   			arm_smmu_uninit_ste(&smmu[i], sid, cell->config->id);
>   		}
> -	}
>
> -	cmd.opcode	= CMDQ_OP_TLBI_S12_VMALL;
> -	cmd.tlbi.vmid	= cell->config->id;
> -	arm_smmu_cmdq_issue_cmd(smmu, &cmd);
> -	arm_smmu_cmdq_issue_sync(smmu);
> +		cmd.opcode	= CMDQ_OP_TLBI_S12_VMALL;
> +		cmd.tlbi.vmid	= cell->config->id;
> +		arm_smmu_cmdq_issue_cmd(&smmu[i], &cmd);
> +		arm_smmu_cmdq_issue_sync(&smmu[i]);
> +	}
>   }
>
>   static int arm_smmuv3_init(void)
>

Jan

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/206d0597-b45b-617a-019a-e80e06b18d2d%40web.de.
