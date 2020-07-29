Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB455Q34QKGQEXNXABFQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33f.google.com (mail-wm1-x33f.google.com [IPv6:2a00:1450:4864:20::33f])
	by mail.lfdr.de (Postfix) with ESMTPS id 16FFE232227
	for <lists+jailhouse-dev@lfdr.de>; Wed, 29 Jul 2020 18:08:20 +0200 (CEST)
Received: by mail-wm1-x33f.google.com with SMTP id u14sf705308wml.0
        for <lists+jailhouse-dev@lfdr.de>; Wed, 29 Jul 2020 09:08:20 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1596038899; cv=pass;
        d=google.com; s=arc-20160816;
        b=IukCqPZby/u9gYAG+iA40ChtwnaIV8kjQYHnCOkndKl6NUhD5JuhzE6eK34So2u9aU
         xStM+jkOqxrjra6z4jsxH++LcWRsgF4VtXudACyJjgwF/AmNDwXSVTwhxS7pwcUAhLZE
         dsy4wME6x7z6DoCj0ShGDstfMxP9ZOzJDVBM6MsdGHr1NWc0bwgdnHxzooh2lz2147cN
         YHtuHpWoBaDQiJk1XzpAePzRuZqUZVzLSsh+7SNNcnZn4A/5ehQxnmwHJknTE+85UwCo
         JUESFFvPW0KiMVKl9eIbOQYydYaBHowlKa0v4ZVUDV+jBBK0NMgRIevvRcKo+ignTAmm
         pWxQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=qh3OVSg2UbpeJBhH1GISfBnvxJz8D2fLU27a8xQ7hjw=;
        b=UiLRkucdX2a6Ci8crPQuZSCEzrGMLAv8Ze1NZyzxHy+0smTt92z92aa7xccETWqhMy
         M8MjXc0HdwBCHO/i2P6841ujOKmf6BZqI5c/UTrCdBTrztF+7pdwJHKJmcu45iS9PNBa
         Py5Z1p6+VRGPJDxWEjQ7YEBTlb/3NIINP19DLfsX7la8rwPlh7dUCtdhEAf4tCrvMXMu
         jKF06AVkXXMMW5UzevKS6lA9XRvSBARm66fnnzkIsTIn6pbr75Spd5afuDA2KQbBvArT
         b4XV1QNVJbfzQq3t7QRbgcahn5IUeNhTLf2e57icDKElBw05vObNWWI/yNAtWfdfyXiy
         vt+w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=qh3OVSg2UbpeJBhH1GISfBnvxJz8D2fLU27a8xQ7hjw=;
        b=pt2M08PMlML4haWzJTXq/Uhj2+s37ujGoIfNIWBjs9/F7QPRkOplcn0LZWp0aGpYFa
         ynYYKCBWag6HQDLONRqpKSG73Za0JCZSQG1NxVwiDLsTm39HDy+liMmrQ1xaC8FCAU1g
         QxSMNPO7B/rvj/7KPDkEkRNxGmh3Scu0v9xg7KCZ8wKY/2pqHlUwfhSbIfUStD2ar3A6
         ab64NAbYt6Du2QCp5z2t47eI+dfE67tZfdPud9Bsm+tX5b+eYMReHXYTNEIOLdqrQ3nc
         xNdjr8P5a69Dn30Iku+vqRhBCI4B109ERtVQunkYKQD/Bulxz6GipxiU0ZaPqyQz7GpR
         VM3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=qh3OVSg2UbpeJBhH1GISfBnvxJz8D2fLU27a8xQ7hjw=;
        b=FPfIl8VAZ3vfY9/X8gRjGQ8zRnJpQ/MwjNByF/BJISY1SeR9wlFBTRKAS1as4JnPNE
         ytxFFGopw20QXnRKDdDBBwcreTywebvLV4cAYVTJUJ22mFvCGOKCanRol3MDO33j2O3/
         zYjgBKR9/V64u7w5Sr95NwE8IcWIQ/M3A0GkPphhUzK1l2BRl5XcnebN2f3bQ492oCD/
         LixXtHD8CT1zaKqW7ySduVJyhkL4ihbREFGNMqeNNJ7c5neipaRFtP57Jg/ixS3c4yJD
         8MNYKeviDL7NVKbQJJE8f1GUrbn8NL5JwMst7NqIpVzUHxuPToynCR/5zMSIa9FoJt4l
         N7dg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533899N+iPQfu8vPK6hN1p5N0UpOi5p8DaiFeDvS6Og5Dlg/HVXx
	1oTapGAw6qZkjUdeLn64IN8=
X-Google-Smtp-Source: ABdhPJx9PVsXLO+M/lOx+443vg3lricXMnaas3KZ/S2IZizaQuBo+EkVwibnHmvF3CoKuvCUwYwATA==
X-Received: by 2002:adf:8061:: with SMTP id 88mr22135750wrk.277.1596038899737;
        Wed, 29 Jul 2020 09:08:19 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:b787:: with SMTP id h129ls1302308wmf.3.canary-gmail;
 Wed, 29 Jul 2020 09:08:19 -0700 (PDT)
X-Received: by 2002:a1c:c256:: with SMTP id s83mr10013483wmf.17.1596038898915;
        Wed, 29 Jul 2020 09:08:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596038898; cv=none;
        d=google.com; s=arc-20160816;
        b=DI6WHDXpyv4YY/ZzkZ7kaDsh+QkVHRtYn3ZkIUybxGoGOcwN1V/kzH4BPA96cOUGuE
         0bXyeQ7SbKkWnXEy+0NRYnxCpQ/Bl6//4vWuwLGmvJ8h3hp2JMqav324sxHL0/pbeeWQ
         bLJjwjG2EFItiuBaND45gt2ZGJuXD1u7Zn5FrnMoSTulL+VEUzUnQqsUUwDQkbBzo6hE
         S9x/kautQEbWHYSueyI5Z+SiltOvQAsfhJ17Y+kUOecD1ugBJGYAO+AurPBAA87fyAtF
         wVF7OvPJxmL6mUrPB8/edK7/dEBFsIcZMmjj6yrYIBcxZSYIjcGVIqHXl7+4hiWAgdA0
         TL9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=SRcauTqcLpCbnuFYswTXttkTWxIUZ8trtNq72Cf4zX8=;
        b=HIgtv2POSnhH13H6CMi1SzxWshAMytf/cEU99lbb97ZcIJQTCJWJkWlyS+gpzLQ9Re
         ZBSedj6zdLl7MZ0JvrljU47B/14mOzHnHiCqRAjpV3m31OrWrTHhl3EMRMECkxBo8Rr5
         HMR4oz8gGqU5BAVAM+jnuKJXUrPuciCgGr1gLX8Au9CBXmNoe+8mTJyYVFcE9ekZPafX
         ntedXmHGQYUbSqGZOB4bmIb+gMuKySELuWrvteMTQhkmQyLn5LvFhR+kuX6J8OFE7jm9
         KcXvt+GWVgcFfzf0/RfvkNKnyDirZS2qVD8ht6cFyjnM2y/E/LMM9FGFG8YkpIKV1zX9
         Dtgw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id f23si336554wml.3.2020.07.29.09.08.18
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 29 Jul 2020 09:08:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 06TG8Irq017150
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 29 Jul 2020 18:08:18 +0200
Received: from [167.87.13.2] ([167.87.13.2])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 06TG8Grk030821;
	Wed, 29 Jul 2020 18:08:16 +0200
Subject: Re: [PATCH v2 0/9] Add cache coloring API and arm64 support
To: Marco Solieri <marco.solieri@unimore.it>
Cc: jailhouse-dev@googlegroups.com, marko.bertogna@unimore.it,
        giulioc@xilinx.com, c.scordino@huawei.com, fabio.federici@utrc.utc.com,
        Luca Miccio <206497@studenti.unimore.it>,
        Angelo Ruocco <220530@studenti.unimore.it>
References: <dad08183-081d-6c31-5be6-305c39a9900a@siemens.com>
 <20200720162639.jsc4o5a7nzinaxwn@carbon.xt3.it>
 <615c92ff-593f-ad69-ea87-1ad439d211e2@siemens.com>
 <76259743-55bf-4d28-f344-1d829e040d00@siemens.com>
 <20200727211308.5mxhkffz5aj27ocb@carbon.xt3.it>
 <8f358d65-eecc-405e-c659-00f501cf5040@siemens.com>
 <20200728091507.35bodtnsvbgcwxvr@carbon.xt3.it>
 <ee0c4b0a-9ea3-4978-43fd-fe38a1321e9c@siemens.com>
 <20200728110945.w4o52pgtq33ic2pv@carbon.xt3.it>
 <d8b12a27-69dd-e47e-a7e2-258192696bc6@siemens.com>
 <20200729153242.f6txtzeqbeqrtcyr@carbon.xt3.it>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <5369cf35-5291-440d-642a-9f23cccc854a@siemens.com>
Date: Wed, 29 Jul 2020 18:08:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200729153242.f6txtzeqbeqrtcyr@carbon.xt3.it>
Content-Type: text/plain; charset="UTF-8"; format=flowed
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

On 29.07.20 17:32, Marco Solieri wrote:
> On Tue, Jul 28, 2020 at 01:30:37PM +0200, Jan Kiszka wrote:
>> On 28.07.20 13:09, Marco Solieri wrote:
>>> Beside the "offset vs next_col" choice.  We would like to stress that we
>>> need it to be aligned with the concept of colored memory that we are
>>> proposing in v2.  This notion is present: in the user configuration and
>>> documentation, and also in the hypervisor code.  Namely, given a color
>>> assignment, a memory region, and a size, we want to map *only* the
>>> needed pages that satisfy the size request.  I.e., not to assign *all*
>>> the pages of the given colors within the given region, possibly
>>> exceeding the size request.  In other words, the size parameter is meant
>>> as the real size to be mapped, not the place where the find it.
>>
>> I didn't finish that part either: I also believe that "size" of a region
>> should reflect the physical size, not the virtually expanded one. That
>> virtual size makes it really hard to read configurations now. Yes, there can
>> be tooling (config checker), but when you start to rearrange regions you
>> will continuously run into those overlap issues because region do not really
>> end where phys_start+size suggests.
> 
> I don't think we have very much choice, here.  We need to pick one
> between:
> - having a true region size parameter and favour misunderstandings about
>    the end address, since phys_start + size != phys_end (v2 proposal);
> - ease reasoning about the real end address while using 'size' as the
>    'phys_spanning_size', since end-start != size (v1 proposal and your
>    currently favourite).
> 
> The situation is symmetrical, but about one point: v1 make the 'size'
> semantics explicitly incoherent.  We would avoid that.

So does v2, see below.

> 
> To mitigate the configuration difficulties without the help of the
> tooling level, we can promote a good configuration habit and comments
> like this:
> 
>    size        = CELLSIZE;
>    // phys_end = phys_start + size*(MAXCOLORS/CELLCOLORS)
> 

...which would be only true if you aligned phys_start on way-size. 
Irrespective of the semantic of size, such an alignment should be a 
requirement to enforce in fact. Otherwise, things become even more 
confusing.

BTW, another - though massively invasive - option to help clarify the 
situation is to rename "size" to either "virt_size" or 
"phys_[spanning_]size" because that is what actually happens 
semantically in the presence of colors.

Coloring does not go well with manual configuration, I guess that is clear.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/5369cf35-5291-440d-642a-9f23cccc854a%40siemens.com.
