Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB25K5PVAKGQEWBBSMSA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23f.google.com (mail-lj1-x23f.google.com [IPv6:2a00:1450:4864:20::23f])
	by mail.lfdr.de (Postfix) with ESMTPS id BE53B94B15
	for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Aug 2019 18:59:23 +0200 (CEST)
Received: by mail-lj1-x23f.google.com with SMTP id j8sf648670lja.1
        for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Aug 2019 09:59:23 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1566233963; cv=pass;
        d=google.com; s=arc-20160816;
        b=ra7rQyYPbac27UcB4+r2jRtocaEDxdwL8U5pwqfCB8wVMW0eQGXDzLk1Ifz/H3Hq5S
         nfN3NQnAxJ9eIVpbEMzGfe6R3QBljNSUtqOHKuH0myfzYR54rGjTieIm9VBucW9FgoL0
         B+YMjeuRQ/Tj+tvFSnRIFinrFvJ6lyMAv65BApjFHjNEc4KXiHIUeZenYFwgECi8tLjN
         Babpm003JreAe4mYMJ858p1k4Yz+bp+HZB6tgyRVWsgWreUonb30xiPAQwFMbDMNI7gh
         J5xS4lvAdBqAZDvBtpMU15qKsQL3D/vDakyjnx1g+gL06IXt0oO8uC7r+DymghaVK9aF
         djOA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=5ustzowuBCRe3hLKZj2xx+P0es6PwEhH/YQVP4eQCdc=;
        b=k7WDfcMoPG7gFYSp2/iHCLzzhGALyqRA49qAVRg0yJl0Sw+8i08733mKSQ1c+ocVDh
         ai/tinbb2h6c6m+Nm33/9wkg6J2pNupXNZ1gtKwC6csJHu559MC5GWkfiXULo8k0lU95
         Fr9j5b642f6FQFZ13VH8Sz+O5edEECy/b2JCqvyPBRZCbsi0hz72KCW6VCTgMab/UCjo
         WJhQyN50pQdlM9CptgApJ0RHkD3BiBtxv6vwjag49ksUhL4sIaV9Pa4SYkDzPc97U3ej
         KfFveCVUX5mHPW9wxbxkCJE90een8jMxv/WgL4kt4SemZrOBzKauXLmXXndNRaTAd0A0
         fQTQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=5ustzowuBCRe3hLKZj2xx+P0es6PwEhH/YQVP4eQCdc=;
        b=CN2OqRjFF38hYmMzp99sJ68USX688pkqjHttl4JEFa1hI1065kIBW7rvIBV3w2/CPb
         4Kp3z6pYf8Jk6JJtz2n9Pc2DOvOSh/fRlvTgyyXM+9nMMKKmlWBFK3vabyvOZBI1mCEP
         l8WJb/qRdRnqASl9Xlz9wKjMfZrAlNx6BiWSuEV3oKuUsulsOE2tac3qeYoyWqC+gP8N
         HJJK2JNrHB3ZvW7Z3FTuCv6VAqpgUMvU6nw0EyNw3AMaPSEGTJoKaHApXz2aWLV13Ket
         6tbj6HpH9RpYaUSJjHEjOaLfFhD1L8MtQNelJJqewL+F9fiMMq+zYZ+437CUC483MGqH
         YqNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=5ustzowuBCRe3hLKZj2xx+P0es6PwEhH/YQVP4eQCdc=;
        b=KCGBsZhAHF+aEXkXLoQLQ35xzraU6x+6F274jIGDqPs4z0sFp0L/OMvEZeyxlxK7je
         +PlT9Zg5GHHsgl8vrTTxUjyKaenjFUW+qvDVmhaB1IhPyDnu2NjpzvFtCqOGB1/Wy4Tq
         E/nrgUjz/e0ZyO3hjJmfp8O8DIL7OqXCeUJXd2D5jk/4zzSw/zdZpYELQD8I1t6+9gkm
         /W8p2IrBVfP/MYFd3IqNgsEj9oq8EHRmzHMOG2lODlKO6mbV5NOI02fhDi5pWnzbteve
         73zRS9yZ5YoY1iMGGWjTj81UKZkNPhhJC8Luk+FP3LuHv6agwoRJac+OAsYkmh0Mtq8M
         t06A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXmEymkNpbKSc/zwUvDIplWMKEX2ynRVyqvUcKt59KL8be67Ggd
	+B5lTbNKNf0e1Jeo5QkUWn8=
X-Google-Smtp-Source: APXvYqwZVcU8ojH7aWLUzwHaLR8YgE2HV0qpmQb4VcsdWF0JiSKEZf94GPTjtQydvzI2wkOCWcRTow==
X-Received: by 2002:a2e:7408:: with SMTP id p8mr183377ljc.59.1566233963383;
        Mon, 19 Aug 2019 09:59:23 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:5053:: with SMTP id z19ls1411689lfj.7.gmail; Mon, 19 Aug
 2019 09:59:22 -0700 (PDT)
X-Received: by 2002:ac2:55a9:: with SMTP id y9mr13312314lfg.28.1566233962661;
        Mon, 19 Aug 2019 09:59:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566233962; cv=none;
        d=google.com; s=arc-20160816;
        b=xuW57IszRgWsmXF14IOO2AUP805NroDzInyVSw8S5b0M01y4RWqLPqmtY3XlMZTF1q
         fSEg2V8AdQicl1yTdIaSiBQco2WTaaM5zcxk46cc1FVcd3Ez6ERnsZ0ySXf0rGN/ZhPA
         k/LT6cWFEloJvIt0rBrYvsOoM1STz1Djb+Xfl2UvrRlA/Z7L4RMXMpYgMPQY4dguIsct
         qqUbKhoRsfbaW7M76Y73/EG2XYycF4FNo2Mz+gTSk17EEcIz9E/TbA0DBnq8Vfo8Jku/
         DZM3n42IyhTPphwdTij3xpiLbWjRB/Mjn2ABM76GwzRqOcG0u4bZw6GAIB2di56yGexg
         USRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=VXzardvVpME148Bgll9fXnJW46/vA0XoSn6q0ckVHTc=;
        b=BfXvmrwYRtOoB1xmGTJ/tc3bPz5iZWLpSaUKQFNf7WMHbMEtIeRWzIrbCzdVnyVGzb
         coZvim7NyZGDyeAiPizdGxROgXZnjSx1tpbhTn+HEnnKVLuDrp0ZTcqUUDRqWQYsIFay
         txMkZz7Ol31ED8/ZjqdaH9FlHOU5QZmBBFg9KApTbg6kuasMUvQZO6w904Afqapit0aU
         P1UFqrHZgqBgM2CMKn3oOqLIkVsZJnmzWzOYvKIN8uDGdcSlkthmocvAl8WxDeG5dRNZ
         bmdX65u9AoLTRtEGoFz5Ji2yKXCXc/oRxxwR+LK9++qibtGfVVCzHO4C6UYAOU3JYgds
         /D7w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id d23si109389ljo.5.2019.08.19.09.59.22
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 Aug 2019 09:59:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id x7JGxLNW029505
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 19 Aug 2019 18:59:21 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x7JGxK5M020534;
	Mon, 19 Aug 2019 18:59:20 +0200
Subject: Re: [PATCH v2 4/4] configs: arm64: Add Linux demo for j721-evm board
To: Lokesh Vutla <lokeshvutla@ti.com>, Nikhil Devshatwar <nikhil.nd@ti.com>,
        jailhouse-dev@googlegroups.com
References: <1566224813-20129-1-git-send-email-nikhil.nd@ti.com>
 <1566224813-20129-5-git-send-email-nikhil.nd@ti.com>
 <429a088c-0f6c-b9f0-bf99-d8b49c634833@ti.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <d6ca6575-4173-b462-0123-23a93566a7f5@siemens.com>
Date: Mon, 19 Aug 2019 18:59:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <429a088c-0f6c-b9f0-bf99-d8b49c634833@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
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

On 19.08.19 18:50, Lokesh Vutla wrote:
> 
> 
> On 19/08/19 7:56 PM, Nikhil Devshatwar wrote:
>> Add the linux demo cell config for j721e-evm board.
>> Also add the required device tree for booting Linux kernel
>> in the inmate cell.
>>
>> This cell config acts as a reference for partitioning
>> devices across the 2 Linux cells.
>> This will be updated as support for more devices get added.
>>
>> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
>> Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
>> ---
>> Changes from v1:
>> * Split up the peripheral mem_region to match with kernel dts
>> * Add GPU, multimedia decoder and display devices
> 
> Upstream Linux doesn't support this node. Do not add un-used nodes.

Well, if it's real hardware that won't be moved around by Linux eventually 
supporting it, we can already include that.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/d6ca6575-4173-b462-0123-23a93566a7f5%40siemens.com.
