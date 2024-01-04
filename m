Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBO563KWAMGQEO2RC3RI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43d.google.com (mail-wr1-x43d.google.com [IPv6:2a00:1450:4864:20::43d])
	by mail.lfdr.de (Postfix) with ESMTPS id 1567F824143
	for <lists+jailhouse-dev@lfdr.de>; Thu,  4 Jan 2024 13:06:21 +0100 (CET)
Received: by mail-wr1-x43d.google.com with SMTP id ffacd0b85a97d-336a56ff1e5sf794932f8f.1
        for <lists+jailhouse-dev@lfdr.de>; Thu, 04 Jan 2024 04:06:21 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1704369980; cv=pass;
        d=google.com; s=arc-20160816;
        b=ysDAjXdwabMgWXuavqEraH7IOOLpxGH/n65jb8aq72lP5AF7ORU57GOJov/BrmXgUo
         pOdhh6+ltoXVcuSmfMPPu1Xt8liZR1l6Ob1E4eRy49VcQDRgdw0rXI6yVhoRjsTaOgKU
         26sJ+EwRD6gFBLpm7dpj0VtBkSampxzz6BIxtVn4ioLRK8duglLuGXre7fr0x9h8fVLS
         XqzRfuSQW5x8sBhwVaFLHE/U7Fze+Pj+M+7lvUVD51Q12ubWAhyME+XPA7Z9sD3QApQd
         XER3Ob9Ssdr24LgsqjDvIUP5xRVHPWMtacIjnB6OdbFFV/16q0nXi6j7csj/Ul7ugcQP
         6J+w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:dkim-signature;
        bh=F9wpKrR0IrpvAHCidj1Rw6p/JUTx7FE1xQ1+HisdFbM=;
        fh=tlpKaXzmTFzNAchb0XU2ZkxIE1viUVT68SEQhlw28ig=;
        b=0BhH7XpTmU8L/7Nn1izGLWL3sqcL5IJZY3p03vIrFifIhK9Q4N8fTfRAsMcpujNmD0
         B67UdoHj2LPJK7JUNUI/wpuXTDZ7lvuoQ5qWqcMJ+vMtlJ5hHEoaGTdbBe/qPwXl9eVh
         kQvhTVkd7lRo4UR3z4azKD+pmCsQl6B87wMpyFPLNRUFEudKcyFRrh5bIMVimgldV/+I
         XR/kesLRVvGfbhWrMxV5oLnQyRXrmZQgAywrqBFhmh3sVfMsHl39rAawrmiXAj+Ac0QA
         WINCTf2EbcepzUz9Umzr/8L5PrMSaazZ219YPfukV6sbovr6AZJ7dYwJ7cBi5SOiTado
         V5ng==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=CqAlZ0U6;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.235.60 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1704369980; x=1704974780; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:in-reply-to:from:references:to:content-language
         :subject:user-agent:mime-version:date:message-id:sender:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F9wpKrR0IrpvAHCidj1Rw6p/JUTx7FE1xQ1+HisdFbM=;
        b=W6ZOxqiSEadT98VqQqGkW18Q7cxySttT82NspcJPt2r082BX27Wi6HSH5lco2KvLmu
         eEPQ+xUEIrWSuFcyo6037ruRcdcTQnWehK/WGv+Wn+5HfbBPkQmZUVI1DPxaFrfSDC3A
         Riic9Y52fORnxxYMldXh6SFFAFjkYWn21P5WzU+h9SJTxQIXHyF9tulwaburxPbvOU8x
         EZH3KybuOPg6PQkJITChH37sPqorVvvVA6mDwP3syeCykvwTIS6ow6vYMFDBe7fz1Iee
         KM3wLW/H1NyhpCjKfRkFd6sv01h4as0+4RPH2UvbG47BZfvdema27+UduX6MVkt0cJlF
         xZUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704369980; x=1704974780;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:in-reply-to
         :from:references:to:content-language:subject:user-agent:mime-version
         :date:message-id:x-beenthere:x-gm-message-state:sender:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F9wpKrR0IrpvAHCidj1Rw6p/JUTx7FE1xQ1+HisdFbM=;
        b=s5ne12gGYIpWPWFlXFuByjdJqIYYOPyj8r3npLpWUYPyqRX1mH4KsyMh6BWcSDje84
         HTXxXtlkdNu60NLv7bPzR6NKOIycQDsB60Klfbeg/y5uiXA1OO8PAbxenZKb48CZjk1d
         j1asMfvOedRKIF13DXDY0sc3Ld+4XQF439zpSQ+xEIPpTH/PgBfjGW1dEvnzh0+6+9ZS
         V/1nCzC9tty2A8iYE6Zk+cDy2e4xFzoVUpZtsZSMiLif2HjZZ+urK9ZaMROQQlZt9rew
         CxGgiCJFGkqf5N5/B1UuAvJkTPo0ygxvus7vOnAG/BaoUEJZ2f8066lMFGlPJ4XkwNWN
         04gg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0YzQIs4Jt2Y+mqBwpOkzNDyE4Mi57B3NVq0dAokueOlMHH7tKatG
	9yISMp9KbsRxiA/U16Oz+O4=
X-Google-Smtp-Source: AGHT+IGzkSlRz89ZCAOImuB9fTEmikM5RQ4NX+HJw0540APbW6KEpopksX1lGfp71ec8h5I9F9xZQg==
X-Received: by 2002:a05:600c:c89:b0:40d:8ed9:ce8c with SMTP id fj9-20020a05600c0c8900b0040d8ed9ce8cmr309075wmb.120.1704369980541;
        Thu, 04 Jan 2024 04:06:20 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:3554:b0:40d:924b:808b with SMTP id
 i20-20020a05600c355400b0040d924b808bls279359wmq.2.-pod-prod-00-eu-canary;
 Thu, 04 Jan 2024 04:06:18 -0800 (PST)
X-Received: by 2002:a05:600c:2192:b0:40d:6e30:4d9e with SMTP id e18-20020a05600c219200b0040d6e304d9emr305766wme.54.1704369977638;
        Thu, 04 Jan 2024 04:06:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704369977; cv=none;
        d=google.com; s=arc-20160816;
        b=i6AshAOtXk9vpKQYNqUG4YYQ33KFvAJ0K/egvClWDuqqBkzZ2ddEK2JGIcX1SeqBMR
         IDJuo5fg3QEmDEHU2iTc7d95OPgJkcTCy+PuNgnYz4p9MACkh3JooltfoUqj6LqhYOSf
         d1ZS7HfXCDKZ5/RvqXwCvpc9pkI+2TYfv+M/r67paSirIVCC55isyBkaKZFm106O6Z/x
         EjAOLegv9Taia+Ky/QorraWOi4zIyWT/DJOjNn5qqHxucxvBXBgYv/dklnX5XSB41Th+
         VGUAkuGzra3kEPyZEM8a+Zt+7GyZwPCRadqI+cM1dnLoz79okwbguR2n0aIBM86eW5RZ
         P1PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=5n329TQNGrB+pm1s6cBYaVQNi9vEo8j2849+0RBLWtg=;
        fh=tlpKaXzmTFzNAchb0XU2ZkxIE1viUVT68SEQhlw28ig=;
        b=Eh2HKF23QheBp+ST8xGaKnXaqXHAeQe+gQoU8LTHIBgRGeJ42IHNs6DmumzbFtlrR7
         yGXpUtfw3MVCN8X1EWRzhb2JnoHgSYIQ85G3L2VhIeTnFfTElnM7LTNRrtaR3jmZp+gh
         onyCaQZqDaDHasecd/7rnALd300MRPeW8wyIFNI6YvQ0omDarye5HY3ah9Y6n35o+1Gb
         CqOiRU4LU2i80iQUa3JKeyYWYsIFIUxcTZSWP3Md/3SNHoF59wXTdhvdjtNnlVB/IBxb
         6ExXPUsmKOnX/TsVwfFN9uym7n3135Blz3aHxdwggJgPsDW+3+I57jYV+BpV1go4QWNq
         hARw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=CqAlZ0U6;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.235.60 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from b2752.mx.srv.dfn.de (b2752.mx.srv.dfn.de. [194.95.235.60])
        by gmr-mx.google.com with ESMTPS id k19-20020a05600c1c9300b0040d932c66b5si137855wms.2.2024.01.04.04.06.17
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jan 2024 04:06:17 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.235.60 as permitted sender) client-ip=194.95.235.60;
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de [IPv6:2001:638:a01:1096::11])
	by b2752.mx.srv.dfn.de (Postfix) with ESMTPS id B06033E0294;
	Thu,  4 Jan 2024 13:06:16 +0100 (CET)
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4T5QKh1SjPzxqv;
	Thu,  4 Jan 2024 13:06:16 +0100 (CET)
Received: from [172.16.2.23] (194.95.106.226) by E16S03.hs-regensburg.de
 (2001:638:a01:8013::93) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 4 Jan
 2024 13:06:15 +0100
Message-ID: <6abe410f-8ceb-4af0-b393-10efc03edda3@oth-regensburg.de>
Date: Thu, 4 Jan 2024 13:06:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Can't install jailhouse on linux-6.1 arm system
Content-Language: en-US
To: Dave Marples <dave@marples.net>, Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <5a564454-0a20-4c44-93c2-67e30025c8a6n@googlegroups.com>
 <4b8c293a-de5d-4ede-ab38-c42294ba3554@marples.net>
 <36d21a58-fb8b-47f3-977f-ab179f0ea8b6@oth-regensburg.de>
 <2305fab7-744f-4cef-90fc-08879ff55ae4n@googlegroups.com>
 <c33ce025-503c-4a9e-b17d-c792587adbb8n@googlegroups.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
In-Reply-To: <c33ce025-503c-4a9e-b17d-c792587adbb8n@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-Originating-IP: [194.95.106.226]
X-ClientProxiedBy: E16S03.hs-regensburg.de (2001:638:a01:8013::93) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=CqAlZ0U6;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.235.60 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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



On 04/01/2024 11:27, Dave Marples wrote:
> The patch is pretty straightforward and attached to the message above, 
> but in case you're having trouble getting it here it is as text;
> 
> ```diff --git a/mm/vmalloc.c b/mm/vmalloc.c index 
> 52f50fe7db83..7fbfad571968 100644 --- a/mm/vmalloc.c +++ b/mm/vmalloc.c 
> @@ -316,7 +316,7 @@ int ioremap_page_range(unsigned long addr, unsigned 
> long end, { int err; - err = vmap_range_noflush(addr, end, phys_addr, 
> pgprot_nx(prot), + err = vmap_range_noflush(addr, end, phys_addr, prot, 
> ioremap_max_page_shift); flush_cache_vmap(addr, end); return err; ```
> Good luck!

Oh boy, good luck is really what is required here. ;)

Find all Jailhouse-related kernel patches here:
https://github.com/siemens/linux (see jailhouse-enabling branches)
and here:
https://git.kiszka.org/?p=linux.git;a=shortlog;h=refs/heads/queues/jailhouse

   Ralf

> DAVE
> 
> -- 
> You received this message because you are subscribed to the Google 
> Groups "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send 
> an email to jailhouse-dev+unsubscribe@googlegroups.com 
> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> To view this discussion on the web visit 
> https://groups.google.com/d/msgid/jailhouse-dev/c33ce025-503c-4a9e-b17d-c792587adbb8n%40googlegroups.com <https://groups.google.com/d/msgid/jailhouse-dev/c33ce025-503c-4a9e-b17d-c792587adbb8n%40googlegroups.com?utm_medium=email&utm_source=footer>.

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/6abe410f-8ceb-4af0-b393-10efc03edda3%40oth-regensburg.de.
