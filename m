Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBNNXVPTAKGQEI45GNUA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33a.google.com (mail-wm1-x33a.google.com [IPv6:2a00:1450:4864:20::33a])
	by mail.lfdr.de (Postfix) with ESMTPS id 20BAD11895
	for <lists+jailhouse-dev@lfdr.de>; Thu,  2 May 2019 13:59:50 +0200 (CEST)
Received: by mail-wm1-x33a.google.com with SMTP id j126sf1755161wma.8
        for <lists+jailhouse-dev@lfdr.de>; Thu, 02 May 2019 04:59:50 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1556798389; cv=pass;
        d=google.com; s=arc-20160816;
        b=RG/RIfWBfdSAoVS2q2AahgI1IaRbtsnkBbO9gLqz5RjDr+qOVM1cwbdf/oi0BfPZlm
         6zd7DS4qdGkrJ3i/IzloOMXj4R4HT/ORK+1uPlmWfsh72bcTxsA1KT78TwpvnrQHNhdg
         t5hJbHceOr5g7mNbCvDxUq0JTm37HrtigetHj/YbsGWJ0e+fi+rm8M1GfiQWwYlO3C8w
         lrmac6p1pWGrNCrQWSJnYbwAyJ89bFNgXOIBVG9MpcEuRx5tJ+aXgB33tplwqHHioJDC
         u2FNMwt+YiapqDveYZny8gKHl+nGFyQ8D7/lE3dBy4+9gJJi7hambd1s8Mj3IXskZxMd
         o+aw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:openpgp:from:references:to
         :subject:sender:dkim-signature;
        bh=A0OIO5ZecWouUjxteGc3GpBa9BHOhtOfAdNPMlj8qZs=;
        b=SEzDn6S2tJ9vFPWpQLbfRY1UlnWzc76aPhh7XJwxYW6+8sFdswNYnOijDiedmDifxS
         faEsuUgPBWULuZP92kBlW41v4ZHa29qbx1xfUB+72RxN39VB+gWUO+/BwXQrmHEEwsGv
         3PrS+3ejANJG/qQYxAH8WFjwv7t4qJx8NqJ/CWHB2oe/vlLpZ7LNL2fPfQ5YFUPjJPvL
         iuaUWS3/lWuPIZCc6XnLabicW0blvHhfqtId18oMfxl4l4kyNBNMtc5Y7OoqGQs6Bu1X
         n7lpZyDlJYVZMyX66lxWro89bU2TQTkXaY6uhj9kOXZH9ymzY0xZt399jxop6yrQju+C
         9G6w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=cJxhWr+m;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:openpgp:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=A0OIO5ZecWouUjxteGc3GpBa9BHOhtOfAdNPMlj8qZs=;
        b=nWiCEsDDtJAOEniZuoooY0Q+iTv03KQEIo1jfHO6sfKPd9ECx0bP7uwgV0qz4RKjPX
         gkR8lx5VocP4WnsWhF3UeoyYXUwPwWCQI2rt8rNdR0lEiNvgb+lgnqjXHU5YGOvTLITD
         YYYXsILbyZJOz5nuX9pUCF57MdYz1oN7PIBPwnk4uegFqmOu6o1lkTnNo9ddIb09rDkg
         u2erV8Agh0eu07PkOPBtBTPKyVHKIZUkcIWoYSaSg0VODtv1zgE4zOfAQfXlMzV6Cx0I
         krcIaPMloBX94DbrWjxra0TJBqnLDCi4NL/IfBVW4kfX5LklKKQC4iWnyZqBn+kMmNgs
         choQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:openpgp
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=A0OIO5ZecWouUjxteGc3GpBa9BHOhtOfAdNPMlj8qZs=;
        b=oHF0zFRI5QcLDuULn3EJ86rRFERZk1FRG8H9UIr+Qf6fKZ/Lgm9gIcR0CW87mcALjC
         DwBGG708zz2iWRiAHHlpF1Nvuo8efpLIi8Ez3MbASJzGIC5eEBvzHJPijvxj4phHi9de
         ViWFVM3basGtip0eOA3w85oSBpx90/aFmMnvvMz+T2Koq+DA4ja+OuBfLM2RPHXddu8y
         n0VO9/xVaLAHOjPvabXMCQHlqQD2v/94/JWBAqkPdaPvC3sygGwGuVpZPQBX+/lfBdjf
         H8m6P427w0IDKLtiyvq72iAnT/r/QNA/DiKcD8GvnTHEYi/tsB1xDKwPHyFnw86nQiZT
         OlRQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAW/Yk/1vAhK3L/TktlhU2UwCX3Oby17Qs0BJrq1iMSeoS+DUOac
	O+MohylKCkCmb+0O63TOUzo=
X-Google-Smtp-Source: APXvYqzpbdtFru2azATo/KQtcyEVE78Z1HtxZ+LPWUZaIVSOyreRdnTcGbmx7WV3JDMqtfu+KRqekQ==
X-Received: by 2002:adf:dccd:: with SMTP id x13mr2432228wrm.33.1556798389872;
        Thu, 02 May 2019 04:59:49 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:8083:: with SMTP id 3ls475754wrl.9.gmail; Thu, 02 May
 2019 04:59:49 -0700 (PDT)
X-Received: by 2002:adf:ec51:: with SMTP id w17mr2663092wrn.326.1556798389406;
        Thu, 02 May 2019 04:59:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556798389; cv=none;
        d=google.com; s=arc-20160816;
        b=GbFoLRdey5zTrh5Zg1fyldCPfiLUCL3uvprr93XuFVNRSHO1RRO9vEp2CoZb/7O42B
         vHZz9aG5aOT6RWZun1ZkDS4EWqmA2Nq4rePGQE97oU7G0Yblqz6rOEN3uf4xR7rLMCFv
         EghOijWhEw1D5EnVH3QWNd3Z53zzo37e3X6jQY4jVJjCfclbjrJxeh4kdJOZ5D4sdWnx
         ibzJJumIpYTqX09ndHkqavSiPDVSyo12oCG5c6wVg3/OCjnjt4quU566tjKumb6V0X94
         SpXLM4pufVwpwY+MOQ9VBzMYd71qAtc0X3tJ+8AqaOiNFbFZ/yefEVsAiLpegZLPzY3s
         /blA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to:subject
         :dkim-signature;
        bh=QOLuroaHijDUqs+1A0My/LBFAhljOeroyVfMenU+7qw=;
        b=VD90hluqTT7gXeL1bKHK41jt71xOYZbJovyJXxouGKEBR0o5yfCv6JIdKJoECpo1CI
         vkfzVYy5Ap6SuNP68wWpvHnpLlvqCd4jGha1yUyMM/cNXqH7yMGHc0lYdGbISjntIYBz
         jN3ebKYjHkfYO2Em5lYYFGwd0S96v206xyfsd6uvfoPKjnoefEo/bBFw4N6ss05VpHau
         LvmI88fLOz2jrB8nr2zm1CqRhhIaZXRrBFVc94S6cCfNNaSHmPLzpCT6EQ4PGzeT/0L2
         9SCTRMPZ9JeNxua3x0e+7Ccrq4AzhqH2Dq7+GGPAr9ORPk4IeIr4/YOX/CmoemR1C3D8
         nbcQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=cJxhWr+m;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [2001:638:a01:1096::12])
        by gmr-mx.google.com with ESMTPS id t1si363642wmh.0.2019.05.02.04.59.49
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 02 May 2019 04:59:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) client-ip=2001:638:a01:1096::12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 44vv2X6xdqzxwm
	for <jailhouse-dev@googlegroups.com>; Thu,  2 May 2019 13:59:48 +0200 (CEST)
Received: from [192.168.178.10] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 2 May 2019
 13:59:48 +0200
Subject: Re: [PATCH 2/5] pci, configs: unmystify magic constants
To: <jailhouse-dev@googlegroups.com>
References: <20190430214504.2153-1-ralf.ramsauer@oth-regensburg.de>
 <20190430214504.2153-3-ralf.ramsauer@oth-regensburg.de>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Openpgp: preference=signencrypt
Message-ID: <39180e19-9787-6329-b17f-447c25035533@oth-regensburg.de>
Date: Thu, 2 May 2019 13:59:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190430214504.2153-3-ralf.ramsauer@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: de-DE
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=cJxhWr+m;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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

[snip]

On 4/30/19 11:45 PM, Ralf Ramsauer wrote:
> diff --git a/include/jailhouse/cell-config.h b/include/jailhouse/cell-config.h
> index 63eb5fa5..e90cd25e 100644
> --- a/include/jailhouse/cell-config.h
> +++ b/include/jailhouse/cell-config.h
> @@ -182,6 +182,22 @@ struct jailhouse_pci_device {
>  
>  #define JAILHOUSE_PCICAPS_WRITE		0x0001
>  
> +#define PCI_CAP_ID_PM			0x01 /* Power Management */
> +#define PCI_CAP_ID_VPD			0x03 /* Vital Product Data */
> +#define PCI_CAP_ID_MSI			0x05 /* Message Signalled Interrupts */
> +#define PCI_CAP_ID_HT			0x08 /* HyperTransport */
> +#define PCI_CAP_ID_VNDR			0x09 /* Vendor-Specific */
> +#define PCI_CAP_ID_DBG			0x0A /* Debug port */
> +#define PCI_CAP_ID_SSVID		0x0D /* Bridge subsystem vendor/device ID */
> +#define PCI_CAP_ID_SECDEV		0x0F /* Secure Device */
> +#define PCI_CAP_ID_EXP			0x10 /* PCI Express */
> +#define PCI_CAP_ID_MSIX			0x11 /* MSI-X */

I just realised that MSI/MSIX cap IDs are already defined in
hypervisor/include/jailhouse/pci.h, so we have duplicate definitions at
the moment.

Will change this in the next version.

  Ralf

> +#define PCI_CAP_ID_SATA			0x12 /* SATA Data/Index Conf. */
> +#define PCI_CAP_ID_AF			0x13 /* PCI Advanced Features */
> +
> +#define PCI_EXT_CAP_ID_ERR		0x01 /* Advanced Error Reporting */
> +#define PCI_EXT_CAP_ID_DSN		0x03 /* Device Serial Number */
> +
>  struct jailhouse_pci_capability {
>  	__u16 id;
>  	__u16 start;

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
For more options, visit https://groups.google.com/d/optout.
