Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBJ6H6OIAMGQEEQHETUY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43f.google.com (mail-wr1-x43f.google.com [IPv6:2a00:1450:4864:20::43f])
	by mail.lfdr.de (Postfix) with ESMTPS id C5CF84C703A
	for <lists+jailhouse-dev@lfdr.de>; Mon, 28 Feb 2022 16:00:55 +0100 (CET)
Received: by mail-wr1-x43f.google.com with SMTP id t15-20020adfdc0f000000b001ef93643476sf938371wri.2
        for <lists+jailhouse-dev@lfdr.de>; Mon, 28 Feb 2022 07:00:55 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1646060455; cv=pass;
        d=google.com; s=arc-20160816;
        b=YlD+M5IqZ77QJ8E6FkWGjwBDjkCweLJV2gf+tuwgWVDqIRPSuA7jCOXvRjoK9aeUaO
         5rgaOZFtwolnUhGr29nKCwucPKGZClkzWcC6nGPKxpAjKeT4jd5WmYHcoSsPX+iNniJp
         Hx4qMp3DR4P3n0yRPfxix1NtChQ5NidjYjGzqfHctOuPmxZH3DNusCW9EiqAGaCaupl/
         0h0SqBJlLH+YwJVdPiNJCLyIv255FrPu12cVBHcsizSXAbsjoKet6Yo2EO2TT015H/b2
         yUsRFIDDST3S1DS6nCV6uZln31A8JMocOi55/D72k8Ssq1EjzFyB53071oyRa57Ne15B
         5xZg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:dkim-signature;
        bh=JLA7sQslK5ssa6lsKKuORtBZJqf9oEIBx93w6BMjCK8=;
        b=URVqOBhDTpIgc92Qc+S+eUbn7T1C78CfFaL8q0WHWhCngfcPcAIW3vdx5MmThNqiaz
         KzfjBGul9YjOvWKFP4OkS8LeE6YchemBajWWEbGUi/x1lc2tufVO49FR4vpY75c71+Bl
         AzVIDbSl1IZbbGF7ATi/lJuLw9YblUMMkKaLIPnSw2QDfYmsr29GhoQm/pb9E7k4b7S/
         N7NpzvpaVQkMJptcljqJzRG7HKC1/1EMLj/7lLsbEYFm9dOPny9u8orn0yk/qvWPC8Fe
         6J4708LW+CzKS2/6ZV2HrOd4zcl4Qj+Spdq6CdOoTQ0ExL1khBlsEQzluVEJGZowFegI
         CL7Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=pqhGENyl;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=JLA7sQslK5ssa6lsKKuORtBZJqf9oEIBx93w6BMjCK8=;
        b=TkPi4XwqhIwn5qPy2aJ7hUPb4BvJPQaG1uqb8qW8bzzMJLjw2fjEjY7jnLfCtOC3zV
         Gv+DxUE+X4SmbNYEiJ66whPub/NNmZ38CtvWXIdWMJdFDRordxHrdRf7k8lkGy+6aCKr
         nq9eSpME9ZM1sYgxnpeU9DPr6PF3wedJhtyAAsBk+/owmSsHNoWWpZnS2X6fo1to2QIl
         3JzZNJIZg1NwE+3aGHuNTTHE/DennZ2STpENKG7/gzWvxa4piVvkqLM8qyre8OkmN59F
         cpi2kTePOIi7K2Z5Z1WI/FaxaKgqLXH4IASrt3lFRsJrsYw79hCXM7fweIZw6FwZWDuW
         tocQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:message-id:date:mime-version:user-agent
         :subject:content-language:to:references:from:in-reply-to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=JLA7sQslK5ssa6lsKKuORtBZJqf9oEIBx93w6BMjCK8=;
        b=kww3KuhooR7cvHBegIm2mQ4zgRWuDY7VTrHWJkWJXWnW3HuzdXW7dgQ0NB+wDtcPNR
         s1/kmxMTMO2Ph1Ia0Dv7GzH4p9qT7g9Jn3kpyVQXNRVIOk16PldxhSqJ8nZ3F3Rrnomq
         /mCb4axe3giFQbcAkUmBmi67ivCZMoiiemynFZikX+BWXr/xY5EmDNzTeP2AMUoIr6sc
         Iy7XF/lWOm76cbBJRUiqmdjLrv+4V0H2M/XAYM/NG6+1h5U94nGEioOI75KGItawjqhh
         RtMR0Pp+P0xnCtnWN5CGUgJAZSJ9EkGRrUgcs2CDHGdmmc9bGFihYmwdS4lhWT85fLTu
         Y9Dg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5338axFoAbU+IOEuil8wKMIIUq75X2/0kAvzMFP8yaM0fa7KcG7x
	oro9vwzv15wnMWAg6AtaOkc=
X-Google-Smtp-Source: ABdhPJynlDWSGf8BwFPIMJoBeJesH3wgxLrmErdUoPtQ5G4EPVHSf7Jn40cjgy7bhrKymrpMHbSbEg==
X-Received: by 2002:adf:f8c2:0:b0:1ed:9ede:98a1 with SMTP id f2-20020adff8c2000000b001ed9ede98a1mr15755397wrq.48.1646060455470;
        Mon, 28 Feb 2022 07:00:55 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:6489:0:b0:1ef:d725:8751 with SMTP id o9-20020a5d6489000000b001efd7258751ls634966wri.3.gmail;
 Mon, 28 Feb 2022 07:00:54 -0800 (PST)
X-Received: by 2002:a5d:53c5:0:b0:1ed:bf1b:be44 with SMTP id a5-20020a5d53c5000000b001edbf1bbe44mr16510974wrw.285.1646060454173;
        Mon, 28 Feb 2022 07:00:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646060454; cv=none;
        d=google.com; s=arc-20160816;
        b=yhD0LVzXdhGEcpK99UCVlZ3nVGZ5r6W3kwAqQsYdOG2uz2JYCcz2JBc4llQZqMdtg2
         Nhj70HQjwUlf1/LCDumGej3r2wdhshhYG/QeifBBV55jrcsTwh/PAQlnHDzuwmqwa/Jy
         ivzLo0s7lN5pH+Q0Jsg4TwS3oAjMNLB2hkv8GTmAYQcM6ghOk/DoPLHei9uWP3crWrYe
         LHzR1PPMycVnZB2tlv5Rb2afvH1fJB+KLOyZcwlunr8Mopsmpvv/5H6CLAeC4EuI6Kpw
         ggKoWN8B4FC7fGc5njTvynzw91ktAJC8AgEtXXFb/MC9oSjkDFQcgO04SoFVuKXjCdlv
         hXvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=hK47xqw0903eWqixTEKHaMj9y++SggKQDL2cl3tqeFU=;
        b=udhZeOA6UwNZ8QMLTrtd1lmSsQp4BTO/SW/ciMLGPM8Z2L8JRQdyn/qtRhtBV06nIG
         k4PVrJEI0e5oGxZuDyRCXhuVDfGWpXo9yujiK+dC4qJ5FLBfhmLFVeRvCA+acAi9FRKp
         lOwskDzhPYNI4jLt/lL1k7kC7smzJyMjkPZA8met4wC8w+WGPluWLvnu/LyGxjTcEUQC
         TGvzi778oYFwwKcL8JITPRvQRQJw0Eq1lgCRmUT8tT75klCksy8yG/uK57Oy3zMhmx3C
         IqbD6pMnkRSWbMNTO1P7quu1/lEZDhLQuDH/cl7iY+WK1iRMQkXICzXwFTfqyajqEgIJ
         0ryA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=pqhGENyl;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [194.95.104.12])
        by gmr-mx.google.com with ESMTPS id v193-20020a1cacca000000b003816971af44si6678wme.1.2022.02.28.07.00.54
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 28 Feb 2022 07:00:54 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) client-ip=194.95.104.12;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4K6k8j5BXSzy69;
	Mon, 28 Feb 2022 16:00:53 +0100 (CET)
Received: from [IPV6:2a01:598:80b8:ad0a:9545:b8de:89d6:7fc8]
 (2001:638:a01:8013::138) by E16S03.hs-regensburg.de (2001:638:a01:8013::93)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Mon, 28 Feb
 2022 16:00:53 +0100
Message-ID: <4e848e2a-b83f-1acb-149e-1625351aadd8@oth-regensburg.de>
Date: Mon, 28 Feb 2022 16:00:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: qemu arm64 question
Content-Language: en-US
To: Peng Fan <peng.fan@nxp.com>, "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>, Jan Kiszka <jan.kiszka@siemens.com>
References: <DU0PR04MB941706295948C00D9D24F4E588019@DU0PR04MB9417.eurprd04.prod.outlook.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
In-Reply-To: <DU0PR04MB941706295948C00D9D24F4E588019@DU0PR04MB9417.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=pqhGENyl;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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

Hi Peng,

On 28/02/2022 10:03, Peng Fan wrote:
> Hi Jan, all
> 
> Qemu arm64 inmate linux and root cell linux share one hardware uart, right?
> If right, how both linux share one uart, could you help explain more?

Define the memory region in both, the root and non-root cell, inside the 
non-root cell, use the JAILHOUSE_MEM_ROOTSHARED flag. However, the IRQ 
can not be assigned to both and will only arrive in one cell. Beware of 
strange scenarios that may occur, when both cells try to access the same 
physical device.

If it's just about the possibility of being able to write to the console 
in the non-root cell, I'd prefer the putc-hypercall.

Thanks
   Ralf

> 
> Thanks,
> Peng.
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/4e848e2a-b83f-1acb-149e-1625351aadd8%40oth-regensburg.de.
