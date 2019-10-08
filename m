Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBTXF6LWAKGQEVYON3ZI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53b.google.com (mail-ed1-x53b.google.com [IPv6:2a00:1450:4864:20::53b])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F98CFE54
	for <lists+jailhouse-dev@lfdr.de>; Tue,  8 Oct 2019 18:01:18 +0200 (CEST)
Received: by mail-ed1-x53b.google.com with SMTP id 38sf11527360edr.4
        for <lists+jailhouse-dev@lfdr.de>; Tue, 08 Oct 2019 09:01:18 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1570550478; cv=pass;
        d=google.com; s=arc-20160816;
        b=gQUXEDtZnon56zB0b8Q2nyn9wjWHwBgE6zmAU55MnXqMh8M7h9rZ+2S6tibe9EmZDO
         Rtvq2VTPT+BuEfBJZeQoYAsgV7Ym9Hb6YCBxtEgw8JpkscaZSeZ30wtFLk6N6+9mKikF
         bwaTF/Z8fXjzp+j4lqUCDIP98iGzI/jVP5wtDtvPF603DrJVnqVUjyuWM4yKfhOBKERg
         C4+Bzkx4d7PpOSnPWcfTN06j4aDY6Ox3LWiA61PRARAld7ywwPM1cFKTR/Wt5ifmUtGm
         gjMO+emvx3ZICrparrbyf8L53dfPyIvFcnhKttgNgXiDvLy/joL0z8D2vtXm7hj+E5Kl
         zUSg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=WWfA4aNx9tM6gXsbcoo7zlLsQ78vWnMYPfpS9q4ji/M=;
        b=Gm87/+Bsr7VWmBSwsHrTpfIX7byMYAB8rSKnZrW1nRNZDwohUn2RkXx2MXzR853LW4
         6nm3ZL/9QceazJ8a26mEDp7jsQFLl1eVqqgiW606hv/tADFT/Sd35KsIMCpQeYpAm3eP
         jfPYOhAqbId1KnElfrg48R4moBeHXpUBD73UZovHljVYl6cNtWV4YQ4e4kCLtRiFl3Ow
         uhpj9sbWRrSNJ+cRUB21EG0Sz8KE93LbmDQz4T2WUpIArnNxBNt67MlHGfRvPshvqUXM
         kXkqHl3C4ejPgc/38GtAxrBmmxrodaFxRLL0+U6e42CTZtJ2p8WmPCqm6KKztM03TEfT
         SCBQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=WWfA4aNx9tM6gXsbcoo7zlLsQ78vWnMYPfpS9q4ji/M=;
        b=A9N2gvSrUyym3rGAqZFfCrjgiPxdQML7501uDj2McIwpX9eqq1jpKskzuZtey3bNwT
         T+fM9abXOrFDn0p7xopdKnhTU3Shf0mNhpTF7b7ObcJx3jujoN2P8GFVIAlehGcPYSee
         qGpRn9xD8GqW0tiTHncW0fwnBxfVe5hl9d3EKvjrByuuj2BDLTuyGOeNlSNm2UPoR9w5
         jJYRNMkb+jctkKErcFqzW9WBhxd0i9Zc3Owf+bn8uC1dUAnHRE61eszkBf6cB9CQhSFy
         L1znnKChR23zwbJqhVMCFmi9cLhkmLxIoXLLAEFBx5g6Puo+xRWXY+GwR3FX6M8l4rXl
         8fVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=WWfA4aNx9tM6gXsbcoo7zlLsQ78vWnMYPfpS9q4ji/M=;
        b=fUPCDKfnZLSAXaALHgWlqXMlgvIwMQ8QSu7VcaOHkJT9FGNZN5DdATooJ/CvRw9oc7
         Xyovm7ZM4q8PCQQuty+MJecxr2doHOYzzTgAUiKqBK30ni+YZKBZk16dd1kc5eOptrdy
         BZ2eUKDSpI/1GeEeDccxpVKZycGR1dCmwOgGhky64Y3q406noVggz95tbY2tDXX7xYTo
         LYNp8a/MYFOi/2t0hx6R23celGzMxBSweKDai0fm/oA2shMSDAsO+LRHqtQhnB+uYOEn
         PeQ4abuRItLqHf3gG6BUlj8K59vA1EKbfUK+vcDR7cHivkl4v2DMTFBT/Kgb3NJH8S+i
         r3yw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAX+b7h2zd6xJfSJnT/AkY797Vj+eg3UdvwpRLpEqU3fivthUojF
	8/qDWun//vVJwDIOgbNx6m4=
X-Google-Smtp-Source: APXvYqz6S311t1aIXR3FjmfytbAtVv9ZEt6yZm1brXnBJy1W/C+HoizrbOE5IrCR6CgviYEZml0wdw==
X-Received: by 2002:a17:906:c5b:: with SMTP id t27mr30017807ejf.180.1570550478311;
        Tue, 08 Oct 2019 09:01:18 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:d7a3:: with SMTP id pk3ls992868ejb.3.gmail; Tue, 08
 Oct 2019 09:01:17 -0700 (PDT)
X-Received: by 2002:a17:906:c310:: with SMTP id s16mr30134306ejz.178.1570550477616;
        Tue, 08 Oct 2019 09:01:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570550477; cv=none;
        d=google.com; s=arc-20160816;
        b=ptLOUHIhdWFUFQce3owLbRpkb3fPgvZHaDtt3DHyypci+ZMOLPdxq993ZOdXyLPhQT
         OFOuB9UPoqeECfRseUmbInkHwZgYFeyhmpU17586Yww90oN5A1AQ3jZeoxUmK9eqQGol
         ztB6xOOA/Q9UX0Dfbrjt7VLRMLwuRpZnu3tSQ62DM+MiHiGBo8nriMvyRsaD1NL1muHn
         hYi0duseuLD5+GzfprIIezkldLXTdkJ2dVtDMNxyZ6FACa4bsGmKG7Sls8tgods1e9+e
         1+IrwIC/ovenZ6gFE4ZvycNq2f6pFuOCh1O067IMfIVeTuK4ulvl0RTUe+kyiLXDeET2
         gZyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=4s3KJgyYyPscxR7pl1wbIHv6Z5Mo+417qYmB7MxLqzc=;
        b=KBh0orydb3tQY25jJ3PMCzeRjbLwm/StvBVWpfUQgrXzXqL+785nVpEEeITNW3Gb9s
         oUA8ToOvTwr8mkdMQhY/NzQEdA7OFG4MJBBa6HNMl0+rTZ94+y98eg769Bxm0evrUJC2
         uJIOGigNgXQw0ae6om4mBtfTTuLgpOpYa4XP18R8UuovdGs5ELUCciuWPMiqLpctDzOJ
         Rqa0+1fW6LohPYoKFLpDqjEPbMb8kSjHwQFC5qBwcT03gH4iIGPz3eXbjVVFjq1De+32
         cGbz/zUX7cxi2x9V/K6bPnVSP63NIrlrlnZtPd1pyLYpR0y1E7N96v30hIAW+/ainrEW
         zwig==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id a15si970149ejj.0.2019.10.08.09.01.17
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Oct 2019 09:01:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id x98G1HEc008530
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 8 Oct 2019 18:01:17 +0200
Received: from [139.25.68.37] ([139.25.68.37])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x98G1H1R023243;
	Tue, 8 Oct 2019 18:01:17 +0200
Subject: Re: [PATCH v3 04/14] pyjailhouse: sysfs_parser: minor stylistic
 fixups
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Andrej Utz <andrej.utz@st.oth-regensburg.de>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <20190930191323.32266-1-andrej.utz@st.oth-regensburg.de>
 <20190930191323.32266-5-andrej.utz@st.oth-regensburg.de>
 <606abee9-5e5a-8add-062c-7a00833de34a@siemens.com>
 <0c40baa8-30bf-d60f-d8f2-860db42ff7c2@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <e2342a7e-29c0-0e2f-ecf2-b82a7d1cd1c8@siemens.com>
Date: Tue, 8 Oct 2019 18:01:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <0c40baa8-30bf-d60f-d8f2-860db42ff7c2@oth-regensburg.de>
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

On 08.10.19 17:56, Ralf Ramsauer wrote:
>>> @@ -950,8 +947,8 @@ class IOMemRegionTree:
>>>                  continue
>>>  
>>>              # if the tree continues recurse further down ...
>>> -            if (len(tree.children) > 0):
>>> -                (temp_regions, temp_dmar_regions) = \
>>> +            if len(tree.children) > 0:
>>> +                temp_regions, temp_dmar_regions = \
> 
> Will re-add brackets here, and in all other patches.
> 

Why that?

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/e2342a7e-29c0-0e2f-ecf2-b82a7d1cd1c8%40siemens.com.
