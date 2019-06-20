Return-Path: <jailhouse-dev+bncBCCMB6PY3AEBBCVBVXUAKGQEJGYXBMQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pl1-x639.google.com (mail-pl1-x639.google.com [IPv6:2607:f8b0:4864:20::639])
	by mail.lfdr.de (Postfix) with ESMTPS id 488484CAAF
	for <lists+jailhouse-dev@lfdr.de>; Thu, 20 Jun 2019 11:23:24 +0200 (CEST)
Received: by mail-pl1-x639.google.com with SMTP id o6sf1230540plk.23
        for <lists+jailhouse-dev@lfdr.de>; Thu, 20 Jun 2019 02:23:24 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1561022602; cv=pass;
        d=google.com; s=arc-20160816;
        b=b4Xnpc4Z6doDTgFPFGA1Ksi1rIh7qtYaRTsAWKLZOJ8glONloqR+r7bbCa3p5OVHGS
         Ci2d+0ewckvU/voJlywiRIAsV5GiPB5o8+D8q6klHmBLaxQodUJ6gcfiOqNueLE1waHO
         9eiNk1Aieoij3cxEPmuvNwjkf9NUzELw5Aj1kXGjoE5HER1a8B7V2fz+l2iJDtrxfVn6
         TgJzbV0LUe2hqNBH7ADleu2wQce2jDxsg56az5dCzerILxymwIFB2VjbS8w4lFFctEoD
         MOv91MzSwfho55SG/UBbAVCIE2geqAQBPbpAsXmWaqvJxkExJg6C9EoAlAubjF9nXIL+
         oHRg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:content-language
         :mime-version:user-agent:date:message-id:subject:from:to
         :dkim-signature;
        bh=Tj8BeHaG0lJco32z6e259zbDcX0vi2SNzAkSOOM1V/I=;
        b=Xtpqxxf1dpgSNPFo2DldtAlIcdGOJx2r8G3SYojO5hA1ZSasdMY2JsWhTqAUwOCp2n
         Zqf0TCmbtUWaM6Q+08qc33+JV8i29fvXoJCEJDrwdKykE9WktHExo0NYm76cT8eX8imp
         22G3e/HKzxUlyjv8AW4fIUuqw6vanu9y74QIaM3xxqzq3RPRjkoTe7AWyHLRDtoG/soM
         qmYiJ2+J70qMBUfsW0Kc1tT3SppHWOrA7EhmuKZ8I6ncZa/Ha78GkmqySF3UHn3o/3YI
         OGXal2XXgPVCGKaacKGOLJr5o1j+0z8KtaHLbokkYywGCqudeNNFUeC8CW5ZVhG6sXDa
         Oztg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=TR8QrpcX;
       spf=pass (google.com: domain of p-yadav1@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=p-yadav1@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-language:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=Tj8BeHaG0lJco32z6e259zbDcX0vi2SNzAkSOOM1V/I=;
        b=Q82s/2BX0hD2uV99wRbAWCBlMjAwAK3jkTekMV3GuuIFdELTywXu/XHtltqiUjXTqP
         NZLzc4dg2urHtPNLggo9JGuQy1v99yU2luTV5fxq0eyUbOBX+C1ZPt0KtCwdKu+SklO0
         jgpXhhyya7SRO+WlekJYpknErFmtjl5S4G53LS0FqWCFLiUyoqo6f60PshTDCARi8uPc
         i9AFAyymvYQHJqRZQV7SKZg4qSZb6VTLLArkERXJRkRZKSay4QrFK1tMKN5QVUIhfbYX
         lDA4Lc/mvLSs6A50k8MbuiCpn8s/gwDwxvUCcGGMKh+w/JA1pPr3JPuSZ9UaoUunLKbU
         ccRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:message-id:date:user-agent
         :mime-version:content-language:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Tj8BeHaG0lJco32z6e259zbDcX0vi2SNzAkSOOM1V/I=;
        b=X+saNwpvW0nrbNeIncqx2AaOL7kflelRhAvY6cYJGUgdHc9oL7XgtJpLDzgUbLr5jY
         eVpSZibrTbv53pG5O71+6AqT++jIf9NHN8Hh43ZZObdIKeib93YlAOjwQjyQF06FAF7H
         N3WHhpV1zujE53diOrN+FRURaRXqsv3+a9f75nddfqd/at/Jpj3yYAf/vc7FmHKQQ0zY
         GdMd/8/buQ6ZA093JMUvNZhEHzew14J4WdhvZiskpIySE7+mp8Rf3PyHUUdBlmRIxdFc
         X1JY8teHJuqQYpqYK6Chh5Jj83LANpS+W1EsUfZ398slZ2NreZzU3/D9o7YMl9mErvN+
         BBDA==
X-Gm-Message-State: APjAAAU4oSo0KcqIadIyzvHPe2IMBWveZsisngwMzd92s40CY82cjdAO
	o0onagP7gGDLFCnCohkYrcM=
X-Google-Smtp-Source: APXvYqxgrf1JEqAGa9k/459zs4K2Mu5DXYTgJkT2h006quotRcJXCJ3uRkMFlnADQ74CmyNBt1sAWA==
X-Received: by 2002:a17:90a:374f:: with SMTP id u73mr2101598pjb.4.1561022602617;
        Thu, 20 Jun 2019 02:23:22 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a62:3483:: with SMTP id b125ls1194512pfa.11.gmail; Thu, 20
 Jun 2019 02:23:22 -0700 (PDT)
X-Received: by 2002:a62:1750:: with SMTP id 77mr62034595pfx.172.1561022602097;
        Thu, 20 Jun 2019 02:23:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561022602; cv=none;
        d=google.com; s=arc-20160816;
        b=yQ83eVIK1NN0J432EyUJ6kI6Mc/LuqHW7+lt5hiWkdXjZNiMO8oOVfuyqwjGYJzemZ
         cfjDV+I6dYp2OW9ruiYwOEGfvj0YDfmN419+Lm+QFNn8ZHLkZQot8A95StmOCAqXeHl6
         Oa7rzMa02wNKtzJxX1RFEycyMbfeWzFWxER6JM2ohdeUdQXeqNenowLgIGPi0Aq137yX
         JzkTP+U4dRiQSS+7nO5E1ck2opw8iMT1O2pCm2NtOZbXMTQu7VnTst3mILjQqwu6DJJR
         rn33MhnkJxokC/HD+26BYuV4WnRBiv2DVAE7uFv1qyh9c8ktG5Gxp3G1w8RcFtEAmKKi
         elyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:subject:from:to:dkim-signature;
        bh=VMhSxCr9AFQpjnijlfP5WfV8gjAWJPo2Th07ZYtivvc=;
        b=VOhq4U82UfqvK/L2+hW5zcn6qSI+vRVEkd9hv/tqY1vigi0ieL6ZoQaUm4WiMEf1lq
         Ok+Ws0ic9T1SQN3M9PxyK1YoMPL5nLF+cH85dLHZGaUXk2am9fddw1QySz5Gqp9BGXoU
         r+b3hJHioZDvbLyzh4GuHd5rMBtkyqz/yVXCDRoUDApqP5ta7m4xSpC7WgfwjVeAuqqw
         0NYp4Mi9XRvMhB2XrhlIN592ZhlQo8BX+8GojsIXy/coQ8eeMaVt1WIg/s3VfIHwfQj5
         OjNyuHE/c+Jy7EgjorJybSN9ZVEi0sCM2jgMgQYZ9fC6jydN63MdU2446/oqOteMZx/2
         hidQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=TR8QrpcX;
       spf=pass (google.com: domain of p-yadav1@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=p-yadav1@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com. [198.47.19.141])
        by gmr-mx.google.com with ESMTPS id d128si818118pgc.5.2019.06.20.02.23.21
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 20 Jun 2019 02:23:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of p-yadav1@ti.com designates 198.47.19.141 as permitted sender) client-ip=198.47.19.141;
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5K9NLRh021027
	for <jailhouse-dev@googlegroups.com>; Thu, 20 Jun 2019 04:23:21 -0500
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5K9NLNj049815
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <jailhouse-dev@googlegroups.com>; Thu, 20 Jun 2019 04:23:21 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 20
 Jun 2019 04:23:21 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 20 Jun 2019 04:23:21 -0500
Received: from [172.24.217.248] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5K9NJ92126400
	for <jailhouse-dev@googlegroups.com>; Thu, 20 Jun 2019 04:23:20 -0500
To: <jailhouse-dev@googlegroups.com>
From: "'Pratyush Yadav' via Jailhouse" <jailhouse-dev@googlegroups.com>
Subject: Writes to pages mapped via paging_get_guest_pages() not being
 reflected in the guest
Message-ID: <6a2e95f8-acf5-0bb9-e35d-ace7ce020ddf@ti.com>
Date: Thu, 20 Jun 2019 14:53:35 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: p-yadav1@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=TR8QrpcX;       spf=pass
 (google.com: domain of p-yadav1@ti.com designates 198.47.19.141 as permitted
 sender) smtp.mailfrom=p-yadav1@ti.com;       dmarc=pass (p=QUARANTINE sp=NONE
 dis=NONE) header.from=ti.com
X-Original-From: Pratyush Yadav <p-yadav1@ti.com>
Reply-To: Pratyush Yadav <p-yadav1@ti.com>
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

Hi,

While debugging something, I wrote some data to guest pages mapped via paging_get_guest_pages(). I then flushed the cache using arm_dcaches_flush(mapped_page + offset_we_wrote_at, size, DCACHE_CLEAN_AND_INVALIDATE).

But then if I read the same memory from the Linux guest, the changes are not reflected there and the old value is read. Why is this so? Is arm_dcaches_flush() possibly bugged? Is something else wrong? The function looks all right to me at first glance.

The area of guest memory is allocated by Linux using dmam_alloc_coherent(), so I don't think a cache flush is needed on the guest side.

-- 
Regards,
Pratyush Yadav

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/6a2e95f8-acf5-0bb9-e35d-ace7ce020ddf%40ti.com.
For more options, visit https://groups.google.com/d/optout.
