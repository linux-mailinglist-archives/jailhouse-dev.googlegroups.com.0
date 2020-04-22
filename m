Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBF4LQD2QKGQEHKRK34Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23b.google.com (mail-lj1-x23b.google.com [IPv6:2a00:1450:4864:20::23b])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4001B3A94
	for <lists+jailhouse-dev@lfdr.de>; Wed, 22 Apr 2020 10:51:36 +0200 (CEST)
Received: by mail-lj1-x23b.google.com with SMTP id k15sf223358ljj.5
        for <lists+jailhouse-dev@lfdr.de>; Wed, 22 Apr 2020 01:51:36 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1587545496; cv=pass;
        d=google.com; s=arc-20160816;
        b=CX3JVslDgLLaMnCDmbgdT0CFmU5TxP7RIMp1Rqy6kAJcffo1/ZADiBpgwn97I6bJ6H
         hHRyXqoZZUEwS70WQ3EenWXOQXdQcEwPfWgMcsD5U5fcW+o8Q4YRCoWQceIgUySmwags
         KHftSPygkcPAm+kAEfqBmntHNFWZIMICQKNISp+dmgLJ1AX4IPKqT8lgD1X690zaaOPs
         P7Xe+JTO2CtJaUNtBau9b3YKg1ZmWLGuNEsmodeGxFVPriL6KvbGHLXVHYgHqNdbyhJ9
         5cIdWg5XaHyIKiv+eiPqVkwPsvt+8E81N7AGfgM5KOOJ8+MnHjVnvK/ALlw0osO40ztS
         PSSQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=9Kb35ZiphL16EYdykX7dU9SwphnXTIAOgY4vA6IHdB8=;
        b=Y3gQKJKFgA44Dwoivj23rca8kCpFGdeWKfeKPY52BPZjdumhmWHpepaIEXc26nZjzL
         WZwgq797fwwGSarCzC8UYhWNiBHbSXP8h2wGL8PRrERu1/3XMXzt3fVb+ARGq6/BqA7b
         RO9Pn3jo9cD1993Lst7DaqK0L6aaefnV2GaIAKsmKUxF1MsTxD/VQyCDk+mAF9/+wDNL
         D2uVU0wnnMzVzeBVKHP9KI1h7B3bxNhTsQLhj3x8Hd6/RWruUvF//I1Y0nz7tNM0Ucbm
         42N9oUY8+Q24WEujsTtqOThQ3BI9S9Om1yARuToMszn05nJuA2nZDpZsKLsUP9maIKpR
         S3NQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=9Kb35ZiphL16EYdykX7dU9SwphnXTIAOgY4vA6IHdB8=;
        b=p19+7yhf+17tY733evuUSI8C7NSG9f+pz+8K6fxC3oD6ZTpK0vkJT6br/v2JPfSvrS
         NAXhhvNB/JAoV0Xvnd9kPnXENtxx9qRw8MC7Vlq2Homyt1h8AlQivh1DkPmi1OEjBuN2
         +pUMOyAnu71pYJnhTjDP/nwkiBrWq7wMa1GxoYDJUVhb6VxWTObAPooqYxZL7Tk3bATJ
         4KXsMTkUQyF+QndifLfPNgDcLz/d/9yRo9/TmhgkBMw+Hbb5HORSHwC+DV/RoktDVbcv
         FQRlFYhFbd9ngTo2fpKEOXRuJFi4cPA2YkDE7qfJ/Kdn27/ADeEjz1OsSwOwom1MH8fr
         Q8IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=9Kb35ZiphL16EYdykX7dU9SwphnXTIAOgY4vA6IHdB8=;
        b=OBwKAfVZk7i/yGJlBFGPJvySqamuwk/QDotpOcjQ5EQ42uR94fIVymkMo6amwoIuFn
         nuF1MMaypvdZQPMes1T8FlW8DNjJgSPIqYRiSXQ3IUIEdq3c7SJZEP5E8p/MWXHVKwo0
         z6T92lla0+tCSZ3CCNpHSWYcqjEXUeXRLNHvVF1CF3HtWB/oJtuqZ2aZrtGDj6x115/d
         GWG4xFzYQRUuLBAgL1KUBS2fhnQqoY4DRqxkBT2zYiAtH73vbKtvW2XhTvQ9JmC+bv4x
         fWPiJ+6ujkch6X7mFmWdo0nsc9UGXUd8wVAYkQGn0r7FXelyncVh4iB8atNifBRoj5/2
         nYQQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AGi0PuaCd0/vkmJWqVIuStE03kOZFEHDzFOr5STrSufHpcX0r2GUuLiN
	zD4pTB/wVxAkFoHSvTzpmmA=
X-Google-Smtp-Source: APiQypIjCSWo9bCo7TPoDh0/XriCFVomIodQtQ5LB7LM5oDz1nTlga4ww8kC53YPGpQru6vnqf162A==
X-Received: by 2002:a2e:351a:: with SMTP id z26mr15287133ljz.162.1587545496006;
        Wed, 22 Apr 2020 01:51:36 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:5456:: with SMTP id d22ls219036lfn.6.gmail; Wed, 22 Apr
 2020 01:51:35 -0700 (PDT)
X-Received: by 2002:ac2:57cc:: with SMTP id k12mr15980534lfo.69.1587545495009;
        Wed, 22 Apr 2020 01:51:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587545495; cv=none;
        d=google.com; s=arc-20160816;
        b=FY5dVr4IifEzN2XiMSDeElBWXZmy1XAtudxabKULCxMqjOzhdcKTE/9FBuLniqruzR
         u10sUBkuKXWhPmZjN29FXgkQ5eK9IYYrLcJlpVLdoA2/MW5SZ7YxsqiwIBS9R+ZGPP9L
         NbQdRN/jqa4oiBZ0ID4GVXfwj30IiWxZnLj+R6KaRcgwOOSTu+RORHrTwl5i9dwCR3XA
         enoBRtNwWwLisw4vKYUXOfq6kOy6Rnlku8FopXBoauosOTSok0gvRATlvOoRjy3JOplU
         HNh2OZc7WqfuMczq+r4lKtyxOtqjcw7kQfAg8NGzYCAbq1WVVMOCmWUlNSt4CJGeAD6c
         84Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=W82U3x8quEalPzLe27JBt+ixY3kIDa+Ig4i6M/1FoDU=;
        b=x7S2pWlMQpWJCVIiX25TnzOLE+zbyw4oPGkXgL0AlvkpQnoE0cyfJJri8Y7aEBtIMn
         GOZb/b9bVcjGd9K1pGv5RLz/IPJg02iaqEmptoV6MHHtRX56Ds0vFVTx3AdvyPXJe951
         5cKmE75LJSLXNO9g3f1yIYkERX2G8Gj843tozBdr1MPk2xqGeW0p4avpZX5SNVnd3Gd9
         cVpxmW1hTxzM8lv+5gnooVefAk7SYMPtn6LTv79twYFVRXxYNzDBWIutYBsCiMFqOgqa
         C8LeCp2QfrlhNFB6cNWB1jdEw5U/j5es79SukJ6qKG8GELtIGdnZsuz0khuvSbisqaq4
         o3NA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id q24si387143ljg.4.2020.04.22.01.51.34
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 22 Apr 2020 01:51:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 03M8pWNS031580
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 22 Apr 2020 10:51:32 +0200
Received: from [167.87.33.221] ([167.87.33.221])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 03M8pUo4013176;
	Wed, 22 Apr 2020 10:51:30 +0200
Subject: Re: [PATCH 0/8] Add cache coloring support for Arm
To: Marco Solieri <marco.solieri@unimore.it>
Cc: jailhouse-dev@googlegroups.com, marko.bertogna@unimore.it,
        tomasz.kloda@unimore.it, giulioc@xilinx.com, claudio@evidence.eu.com,
        fabio.federici@utrc.utc.com, Luca Miccio <206497@studenti.unimore.it>,
        Angelo Ruocco <220530@studenti.unimore.it>
References: <20190327121849.1882-1-ms@xt3.it>
 <7e92c41e-12a5-28fd-b1fc-4949e5ccac20@siemens.com>
 <20200422072259.sc2au24ksnt6j7jy@carbon.xt3.it>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <9605c893-d940-ce35-8301-832d31382c88@siemens.com>
Date: Wed, 22 Apr 2020 10:51:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200422072259.sc2au24ksnt6j7jy@carbon.xt3.it>
Content-Type: text/plain; charset="UTF-8"; format=flowed
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

On 22.04.20 09:22, Marco Solieri wrote:
> On Wed, Apr 22, 2020 at 08:42:32AM +0200, Jan Kiszka wrote:
>> On 27.03.19 13:18, Marco Solieri wrote:
>>> Predictability of memory access latency is severely menaced by the
>>> multi-core architectures where the last level of cache (LLC) is
>>> shared, jeopardizing applicability of many Arm platform in real-time
>>> critical and mixed-criticality scenarios. Support for cache coloring
>>> is introduced, a transparent software technique allowing
>>> partitioning the LLC to avoid mutual interference between inmates.
>>> [...]
>>
>> Thanks for updating this! I will refresh my caches on the topic and
>> provide feedback soon (I already have some questions and remarks but
>> I'd like to double-check them).
> 
> Looking forward to hear from you.
>   
> 
>> As you likely read, there are better chances in sight to also address
>> the root cell issue by booting Jailhouse from a loader.
> 
> I share the same view.
> 
> On the other hand, it ties the cache colouring with the
> Linux-independent boot.  This is not ideal from an quality perspective,
> because it introduces a dependency between otherwise unrelated features,
> including one definitely optional (as long as Jailhouse will stay a
> "Linux-based hypervisor").  Also, from a process perspective, it forces
> the colouring-related activities and deliveries to be postponed after
> reaching a somewhat stable architecture for the independent loader
> (colouring pages is a loader matter).
> 
> The other option is the hot-remapping of the root-cell memory, which we
> already wrote and tested on an older version of Jailhouse extended with
> a SMMU support.  From a quality perspective, it looks comparable, and it
> does not introduces constraints on the development process.
> 

As pointed out back then, there are still open questions regarding the 
reliability of such a hot-remapping approach, besides the complexity.

Anyway, we now do have SMMU support in Jailhouse (first issue to report 
against your series, patch 9 ;) ), we could look into that systematically.

> 
>> That would then leave us only with the question how to handle the
>> hypervisor itself /wrt coloring.
> 
> Correct.
> 
> 
>> Provided that can buy us worthwhile improvements.
> 
> We already have experimentally proven on two other hypervisors (Xen and
> Bao) that the interrupt response time hugely depends on the cache
> performances of the hypervisor's routines for guest injection.  Cache
> partitioning is therefore mandatory for predictability.
> 

What measures did you apply on the hypervisors? Replicate the code into 
memory that has the "right" local color? Ensure that core- and 
guest-local data is in color memory? How did you handle naturally shared 
r/w data structures?

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/9605c893-d940-ce35-8301-832d31382c88%40siemens.com.
