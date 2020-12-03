Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBYVLUT7AKGQEPHCJTAI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13c.google.com (mail-lf1-x13c.google.com [IPv6:2a00:1450:4864:20::13c])
	by mail.lfdr.de (Postfix) with ESMTPS id 406C52CDB74
	for <lists+jailhouse-dev@lfdr.de>; Thu,  3 Dec 2020 17:44:19 +0100 (CET)
Received: by mail-lf1-x13c.google.com with SMTP id 190sf639499lff.4
        for <lists+jailhouse-dev@lfdr.de>; Thu, 03 Dec 2020 08:44:19 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1607013858; cv=pass;
        d=google.com; s=arc-20160816;
        b=XlffX1J1fjRbHl4dYcXUswmJ1ARzOD36kmKCUnfBNdDQH+3RIH7W4/5BwJPQc3Al7r
         yI/EIIiFmxtKbfQfM7N69/0lU7etejFo7hj38F2KHFkMh+i2hlMzb6b9K+9VI09o4Rhz
         uri65GH8pxczF4GjSvmeqIHrzUoFJGzp083ea3XPYZfpYRtAe06G4/Bp3Ufl1E2m6N+e
         PeuS1XJG6E2mxGHUC1teV/mSc3rxxmN1748J+eB6bXcAcPKDeDSaIbmnMKHmd7eauI7O
         6QaiTzZCMZMiEZdzaWFyIpygBO9GXeAWRXzBnrUnb2k3quCrhlhUW5rWjNLT8tfHVyeb
         MzJw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:from:references
         :to:subject:sender:dkim-signature;
        bh=T9j9WSszuuK6N43zL4zJFnaZGSBD2599hFIskjyhtOQ=;
        b=UlD5czhEAHbf8qDlTviXgkLdEVXwWM7QN70jU+v5LZ0b6FZucInouqg++WKa/fqHnf
         cPTET6Lda/mTeb6jcosM8qnoRhCjSzXBirps7TO4RnQki69Mzgo5YZcSxFm2sMzFsuXy
         3rTT5aWR41S3vOe6jwIAf3mmH/My0wVpPBmPex0Ty4NOlrKPmCXlgor39dJZn1taHcAr
         EbNsDAoTwK2CkOn+XrivOU/eTp8h24dnHlTEEJ0NTfAFbX3vbty/vqjzIid8lTfwlYKh
         1yOc+b0JIptmaSDmVQ7YSErggjDZrPXBFW8m7dxq0BTgdMYcdKNDEFUbhyRRrEC6y8KB
         3gkw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=SzCx+ftv;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff89 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=T9j9WSszuuK6N43zL4zJFnaZGSBD2599hFIskjyhtOQ=;
        b=CsdXEX+Ouc6olgXRbw7NeHDV3pG1ZQNwk6l/zFHIVcltfOuELkjyLgBzDd853bgrrH
         26/2oi0BJAFyQ9HJKHIHWgTED3mYpve5mgObjhOp/xfLP5qC44oCeuuHdof5n6hzU6AX
         jzRPDoOqZltK1236n0B+/EXKuqZX0Nx+XbrW1VfLEMk4cgJ+LLwe6o06pAQ+T+9lobOk
         CQTiVCz63nedkWsBZE71QjzmlZB6Snk6FIfrhb6DiQDKaU5mjHF51xKYWOzsShDF64v7
         1VHKSLbg5rKIGyfz/8ypfGmxm17smLwvMJWVycEjGBmbp5GRAjevY1HZ8oLfGPnNdkJU
         TPFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=T9j9WSszuuK6N43zL4zJFnaZGSBD2599hFIskjyhtOQ=;
        b=BxeKSUehMcVnnhWxDfJpxo/MKvU70T11TTyxIlelesEPFA0FgGyWsMlQtBaBN+71/2
         bAMsGIAaIaRNgFL1QfC7pghRsG+CN3ej9ZczVMB5GfsTSaLWFa0RjQ+ZPjMCyW6epLiv
         czicig2C4kDcUUQ6D3h7NC6RM4YLB1Kd8wadJZORxtB4McZOs1tcBBLHkJqckhC2zL0J
         IKO4GvVo3aygFU2oicmNOkzCY4h5gdNlIhY/S67KQETccJ6e/2X0jfL8JSQversCrZG6
         OEpX+/TYktNWCalG8I65iFpZyb5oTphVwMmUM7asFZ+V08drSKHJXIuLsbGk5UQUxDbt
         rpdg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532WdEOTVbkrLdPYEROI8nW44UqJSbBdgLL08yzrBN1OkEIwS+ds
	UqqfjOxjUs43YPFbv9Kk8Qs=
X-Google-Smtp-Source: ABdhPJzMNPMpER7q4cGfoMD42cVbFld5QuRRQcibRFfT/htzHFsK4IyT6gQYk0vYbgjMCQd40VP8Rg==
X-Received: by 2002:a2e:9a4c:: with SMTP id k12mr1585024ljj.366.1607013858818;
        Thu, 03 Dec 2020 08:44:18 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:bc2a:: with SMTP id b42ls1103299ljf.2.gmail; Thu, 03 Dec
 2020 08:44:17 -0800 (PST)
X-Received: by 2002:a2e:6e14:: with SMTP id j20mr1620507ljc.372.1607013857582;
        Thu, 03 Dec 2020 08:44:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607013857; cv=none;
        d=google.com; s=arc-20160816;
        b=b/dEgYyt81g08G/qzRhS6Jat1DA1z7wnNocQWlUhlLtgtj98Yd+SV+/QhQ5KsJoxPp
         8g7+KU7HE6JcoqGa9aEcvijv5STbwoOWl8877UchDrXrR+CImjZ7V2M6aH3myxvpPK93
         9C8ArFm3NXnxMJqBS2/ETccLpMN9mnr6znPH9XAeiX8ISwMknIe/E8y+3U5BbOdGNgf1
         CNfnzHoCG6QBD7VnjVd6iWdnVsj3XdSmCGkmEsKFEC8yNf8esd2w+DR2kh8LWc/+A/7O
         19WHhZ8bwBE6fLTZM4X22+S7o5AhGw6VCn99MOmLIGGw/lNPtFtB4CnptNpMawjs9EV6
         6CPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:to:subject
         :dkim-signature;
        bh=v5nqNzXxAINQXRJbd28OtCK4yp4GA7MY+4e7twQJzL0=;
        b=TphZ0H7wiNi8kTQGjQ9ieVjaOVG+dYjV3siQKVtyNivMFHgpUhN2BNmso1ThxF6q3F
         PJ2GbCNq2W49mzaNe3fuWiA0MsLiUNVywItZVSE+z5UcDC+8Kmw7nH8o7piSA3bhO1Mw
         WXALOawvebWMRryq6IRbAk0pxGLK2bG5C+46dR++XPoSdLIt545PriDf3odvWgIUnuBC
         SVg74Hb9VoeUbgKJGYL1VeylcIfvQ+JqNWOwgmLWgtcU6a5pGFQDZoxLgBnvUdFn+z7h
         +5OetN4mP1RIFo/KKRSgmgwGXGmn3pB00d/wY1ZljWf5IJunUG98jdU3OaMp00f7oPN3
         hqfg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=SzCx+ftv;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff89 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout1.mail.lrz.de (postout1.mail.lrz.de. [2001:4ca0:0:103::81bb:ff89])
        by gmr-mx.google.com with ESMTPS id s15si54772ljo.2.2020.12.03.08.44.17
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Dec 2020 08:44:17 -0800 (PST)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff89 as permitted sender) client-ip=2001:4ca0:0:103::81bb:ff89;
Received: from lxmhs51.srv.lrz.de (localhost [127.0.0.1])
	by postout1.mail.lrz.de (Postfix) with ESMTP id 4Cn1rd07rfzyWL;
	Thu,  3 Dec 2020 17:44:16 +0100 (CET)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs51.srv.lrz.de
X-Spam-Flag: NO
X-Spam-Score: -2.873
X-Spam-Level: 
X-Spam-Status: No, score=-2.873 tagged_above=-999 required=5
	tests=[ALL_TRUSTED=-1, BAYES_00=-1.9, DMARC_ADKIM_RELAXED=0.001,
	DMARC_ASPF_RELAXED=0.001, DMARC_POLICY_NONE=0.001,
	LRZ_CT_PLAIN_UTF8=0.001, LRZ_DMARC_FAIL=0.001,
	LRZ_DMARC_FAIL_NONE=0.001, LRZ_DMARC_POLICY=0.001,
	LRZ_DMARC_TUM_FAIL=0.001, LRZ_DMARC_TUM_REJECT=3.5,
	LRZ_DMARC_TUM_REJECT_PO=-3.5, LRZ_ENVFROM_FROM_ALIGNED_STRICT=0.001,
	LRZ_ENVFROM_FROM_MATCH=0.001, LRZ_ENVFROM_TUM_S=0.001,
	LRZ_FROM_HAS_A=0.001, LRZ_FROM_HAS_AAAA=0.001,
	LRZ_FROM_HAS_MDOM=0.001, LRZ_FROM_HAS_MX=0.001,
	LRZ_FROM_HOSTED_DOMAIN=0.001, LRZ_FROM_NAME_IN_ADDR=0.001,
	LRZ_FROM_PHRASE=0.001, LRZ_FROM_PRE_SUR=0.001,
	LRZ_FROM_PRE_SUR_PHRASE=0.001, LRZ_FROM_TUM_S=0.001,
	LRZ_HAS_CLANG=0.001, LRZ_HAS_IN_REPLY_TO=0.001, LRZ_HAS_SPF=0.001,
	LRZ_MSGID_HL8_3HL4_HL12=0.001, LRZ_MSGID_MOZ=0.001, LRZ_UA_MOZ=0.001,
	LRZ_URL_PLAIN_SINGLE=0.001, NICE_REPLY_A=-0.001]
	autolearn=no autolearn_force=no
Received: from postout1.mail.lrz.de ([127.0.0.1])
	by lxmhs51.srv.lrz.de (lxmhs51.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id QMeZbp8EOkLf; Thu,  3 Dec 2020 17:44:16 +0100 (CET)
Received: from [192.168.1.23] (ip5f5ac6d0.dynamic.kabel-deutschland.de [95.90.198.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout1.mail.lrz.de (Postfix) with ESMTPSA id 4Cn1rb6Yl7zyWD;
	Thu,  3 Dec 2020 17:44:15 +0100 (CET)
Subject: Re: [PATCH v4 1/2] arm64, configs: SMMUv2: Separate stream ID's mask
 and id
To: jailhouse-dev@googlegroups.com, jan.kiszka@siemens.com
References: <20201203163914.54762-1-andrea.bastoni@tum.de>
From: Andrea Bastoni <andrea.bastoni@tum.de>
Autocrypt: addr=andrea.bastoni@tum.de; keydata=
 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
Message-ID: <18fc549b-6155-15b0-4886-2174209f6407@tum.de>
Date: Thu, 3 Dec 2020 17:44:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201203163914.54762-1-andrea.bastoni@tum.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=SzCx+ftv;       spf=pass
 (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff89
 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=tum.de
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

On 03/12/2020 17:39, Andrea Bastoni wrote:
...

> diff --git a/hypervisor/arch/arm64/smmu.c b/hypervisor/arch/arm64/smmu.c
> index df92fb7a..7869b66b 100644
> --- a/hypervisor/arch/arm64/smmu.c
> +++ b/hypervisor/arch/arm64/smmu.c
> @@ -84,6 +84,10 @@
>  #define SMR_VALID			(1 << 31)
>  #define SMR_MASK_SHIFT			16
>  #define SMR_ID_SHIFT			0
> +/* Ignore upper bit in ID and MASK */
> +#define SMR_GET_ID(smr)			((smr) & BIT_MASK(14, 0))
> +/* Mask is already specified from bit 0 in the configuration */
> +#define SMR_GET_MASK(smr)		((smr) & BIT_MASK(14, 0))

Note that by using BIT_MASK(),

...

>  
> -	for_each_stream_id(root_sid, root_cell.config, n) {
> -		if (sid == root_sid) {
> -			printk("Assigning StreamID 0x%x to cell \"%s\"\n",
> -			       sid, root_cell.config->name);
> +	for_each_stream_id(rsid, root_cell.config, n) {
> +		if (fsid.id == rsid.id) {
> +			printk("Assigning SID 0x%llx Mask: 0x%llx to cell \"%s\"\n",
> +			       SMR_GET_ID(fsid.mmu500.id),
> +			       SMR_GET_MASK(fsid.mmu500.mask_out),
> +			       root_cell.config->name);

the type change. This is normally hidden when you explicitly assign back to an
unsigned int (because W(int-)conversion is not enabled), but e.g. not here.

I now remember why I used 0x7fff in the previous implementation. ;)

-- 
Thanks,
Andrea Bastoni

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/18fc549b-6155-15b0-4886-2174209f6407%40tum.de.
