Return-Path: <jailhouse-dev+bncBCOILS5LREFBBA6EVLUAKGQEYDQT6XY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53a.google.com (mail-ed1-x53a.google.com [IPv6:2a00:1450:4864:20::53a])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8894C2A0
	for <lists+jailhouse-dev@lfdr.de>; Wed, 19 Jun 2019 22:58:44 +0200 (CEST)
Received: by mail-ed1-x53a.google.com with SMTP id b21sf1031493edt.18
        for <lists+jailhouse-dev@lfdr.de>; Wed, 19 Jun 2019 13:58:44 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560977924; cv=pass;
        d=google.com; s=arc-20160816;
        b=eFB38BM15q7hhr91fHQaRdqVrCQeQUq446NOqG+iIgYZFwRwts514Yw04HuXW2Chv7
         UOCPcbdBrsRVO37um4JSJSoUO/2Fh9Q8UQhA+pcosv6aCS1ZSUtLzAnaNlQMiA0Q01OG
         wGGAQXCS5JCUVcTOX9mnRoupJBli7CUTWyAmu/CWZC8RsSKyS/aekJNoiWefi0mSt4Gq
         8BeFj85CyFV9RjaKElhOP5Ul6jCjI7jBB2aAd/0A1t/0xYjOpUNtC1w0kA7rjSCFBmSb
         rP9u8PTHS+FXs9TcjLfKv58kDboYzKV0I/BQRKFcZKl5t/3j5kSYTNj2xGD+Xf0e6gRG
         D/nA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:mime-version
         :user-agent:date:message-id:subject:from:to:sender:dkim-signature
         :dkim-signature;
        bh=3N4dunGRWoXqR8FDUIZqbWdawMd/Y5X8K6bSUZ08ZZ8=;
        b=Cjx8N/6QvOhKaI9G8IAVCFeXVZOCDVSmKB5Czm5y6HRE5yrAuPw0KoaKY2FV06sIMB
         HnCJDui+n1nkjjHofdS4OqIaJb0CANZQnDT8em+LcC73jF6XaHVp4XFvDTdpRotHJcLc
         7kJegl78ojna65FL1kgyUh0XTzJ7LcLNFrzT99LeMG4XfoMbZl8tBt6mZQV2uhPD+Qmr
         RCpOriPuc0din18fBCEK4IBmPZKM/ChlOdM02r5ZPsKAosZWVKaIQtOOeEgfVC2Zwi7q
         4OIHBLDaJZn80o12FkCwJSGyWqXzKyyOsSdYHQxW7c9he8rQ4wEkve7hYNiGNpYuYdl3
         4jAg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=AxdHd0cV;
       spf=pass (google.com: domain of carlo.caione@gmail.com designates 2a00:1450:4864:20::429 as permitted sender) smtp.mailfrom=carlo.caione@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:to:from:subject:message-id:date:user-agent:mime-version
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=3N4dunGRWoXqR8FDUIZqbWdawMd/Y5X8K6bSUZ08ZZ8=;
        b=QjnDg6gHkMKbc9mydC8vTbdlUPLqJBj2QCBMytnXt/btHeCNeneyLEJnIgLTYe0R7Q
         E68lrakZ5azs12spppl3wnZkNFaIUyA3eQFrToC1O/7VNkFoj9RLMSkg2Ip4d/zZOBOA
         fH6YZUMLIzesBhDKookjWK0K6Mt6p7nKvgAXxqYVTfk+ZjOWevV243P34ls0GdlokTUG
         gPjOFF/qxIO02IdaFQTd0cW+kl1jO4iBKdekQUQYhKVYCs73dVD2wHd5BhkNIgRAzfUJ
         WLqfpZDcwI/oofJWdDlg/IXJCb5eLTUy8LlqWf9hQqoCNWEVkaF58yE3MyQS2ocbW4ZT
         0F5g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=3N4dunGRWoXqR8FDUIZqbWdawMd/Y5X8K6bSUZ08ZZ8=;
        b=OWcdRifXfc4mQk8qr4N+gwad8kQwcHJRh+4GH9BYgkAOFcZ2G2YT3RmIX3DpYrFiWa
         MrmVtWdiQxwBcw5kqnu1dhr/OlBC9j02v8nZqizQBSlup+HQRrKyPAchAWTDIso36OOA
         dbybVgr+X9eaF+tVlfadK5OwYETGJGcvh+qpSdjKvUNTng5sh9/h99BnIZ+blV41EPr9
         +r89lHXyEVQHhjGXYO2d9vOWqPoe+nNEEDGAASRKK2M1aSCZSXL+ov5pYs67qxjTtocH
         BnJ00GZitDN1oI6/Y0Co/KV1VM/P+vcYnHLAdGAR6wvzUna3J+BCwApPktt6JR7+mAhw
         K0XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:to:from:subject:message-id:date
         :user-agent:mime-version:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=3N4dunGRWoXqR8FDUIZqbWdawMd/Y5X8K6bSUZ08ZZ8=;
        b=dazNolbb0INipKDdKgFFXIzYxkvlnp9u864tLByNgMAoFBEKrZoUJqsqansM+vIZUP
         1nk45sRGusuoPh1Jxp352UWpkhuDPVLvGT0bORye8QN3S2ugUhgGlJSyx1UC6/hMB6gR
         fpGHkvaHZIONfKfneFizETMGTgxcL3kNKgvVxdXRigM8b+DBUcz4hmLQ8GoTQQTSemZy
         Dgux9fToU5DrBNVjmzpW0MT9sP4atdmMNyqBPqTuq71e0pJIbEzAM+ZeaP9VRkat94ij
         D+dVzBoT+2ouLz+2hYd+fHm9TLJOIjV7GS7h3ebjg8Xlmlrd2oorOABRGRiuEwi79JW4
         QxEg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWdaPjSME6sz1eyTSJegrsz5zLV3qWLIP92S3b/QLnH//QK2wfo
	m8H1/OtoDbpyrhzuGW/F6O0=
X-Google-Smtp-Source: APXvYqyfthcgv7uj2Rcl77N5aTpIqt86AxQGEMo3icz2hJXW+HCxU0OBKQcIhvwfFRlIYAaIw6KJ1w==
X-Received: by 2002:a17:906:5384:: with SMTP id g4mr36819778ejo.241.1560977924131;
        Wed, 19 Jun 2019 13:58:44 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:aeee:: with SMTP id f43ls1083465edd.15.gmail; Wed, 19
 Jun 2019 13:58:43 -0700 (PDT)
X-Received: by 2002:a50:8a85:: with SMTP id j5mr85789531edj.304.1560977923361;
        Wed, 19 Jun 2019 13:58:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560977923; cv=none;
        d=google.com; s=arc-20160816;
        b=aURn6sUTcwI/IVqjoOHPBp1xN7AVhs3C+PWLhFTHfpm70OzTvUOY5/mKqAgDkE3gLZ
         5wiJZPyGIQAoeMXv06uFz5OVa7b6qxFrAvs3aImNLOZ2xnM1jFSBdmOFSI4pP0R4L1zT
         Ja1+eRor4woVd36ef+N8sOqmD9oSaL3FRNMR3B90JhGuLluUKqPP8wIi6OWYAtMTc5qS
         9JPOdno8nvkBhuVWtEqHaR4DzxvOxPvI7ItdAiH/mFfi6i6y5+eXEbxz0J+ct8n8ihcT
         U1rnHqPvI/K6kC7JoNqD9oSUFz1s4vsCe33B4UmwpmhHva1BVG9s7TaTpVs4KnUTm8mm
         Sy7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:subject:from:to:dkim-signature;
        bh=JA9h9EXMyVFPwhc3XOniRoLyYJQyhuF8AIbAgCIThEY=;
        b=Yb2xxxzVwTU26611ggjCs9D7/8nZmGorLdubzRCd54rx5y9Fq2HVnLd9HT/kvYLpwL
         QFhOs69ZbzhAqERNVcanPn0LYd4ljwaW5+8xsUNl9qbiusTg6lWmRmxDYaBO9dV7tmbq
         UF3uUrNMTbU/HRdo8dIRBIw0fKwk6Oi58fChbM+YCp2pP+hgJcL0PX7w+zwtw5VuLIQe
         iWyPEZz1CExHBn2jCY2lLB7vgYa3gGYLaY3EhZovhoO62619sl7sUeapvBPCk9Vw2nlC
         tTQQ59jwCZdD4xqnbIM7mN7gvRXRlB9Rcnkh8+r6XYW8aarEzOLMFdAxP2o92+JhtVka
         Bi7Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=AxdHd0cV;
       spf=pass (google.com: domain of carlo.caione@gmail.com designates 2a00:1450:4864:20::429 as permitted sender) smtp.mailfrom=carlo.caione@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com. [2a00:1450:4864:20::429])
        by gmr-mx.google.com with ESMTPS id a41si155418edc.5.2019.06.19.13.58.43
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Wed, 19 Jun 2019 13:58:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of carlo.caione@gmail.com designates 2a00:1450:4864:20::429 as permitted sender) client-ip=2a00:1450:4864:20::429;
Received: by mail-wr1-x429.google.com with SMTP id n4so641649wrw.13
        for <jailhouse-dev@googlegroups.com>; Wed, 19 Jun 2019 13:58:43 -0700 (PDT)
X-Received: by 2002:adf:e7ca:: with SMTP id e10mr28183898wrn.281.1560977922733;
        Wed, 19 Jun 2019 13:58:42 -0700 (PDT)
Received: from ?IPv6:2a00:23c4:f78c:d00:1570:f96d:dab8:76ae? ([2a00:23c4:f78c:d00:1570:f96d:dab8:76ae])
        by smtp.gmail.com with ESMTPSA id v18sm12239437wrs.80.2019.06.19.13.58.41
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 19 Jun 2019 13:58:41 -0700 (PDT)
To: Jailhouse <jailhouse-dev@googlegroups.com>
From: Carlo Caione <carlo.caione@gmail.com>
Subject: jailhouse hangs after enabling
Message-ID: <1d8841cb-24a8-f75c-9157-d03776cea4af@gmail.com>
Date: Wed, 19 Jun 2019 21:58:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Original-Sender: carlo.caione@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=AxdHd0cV;       spf=pass
 (google.com: domain of carlo.caione@gmail.com designates 2a00:1450:4864:20::429
 as permitted sender) smtp.mailfrom=carlo.caione@gmail.com;       dmarc=pass
 (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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
I pretty much a noob with jailhouse so hopefully this is not a stupid 
problem :)

The problem is that my whole system hangs immediately after enabling 
jailhouse.

Some more info:
- hardware check is fine (at [0])
- jailhouse is master, same for the next branch
- root configuration at [1]
- cmdline has intel_iommu=off memmap=0x5200000$0x296000000
- kernel is 5.0.0, same with 5.2.0-rc5
- kernel configuration is the default shipped by ubuntu in [2]
- the kernel conf shipped by jailhouse-images (amd64_defconfig_4.19) 
makes my system non-bootable (yes, I should probably try to fix this)

The issue:
- after issuing 'jailhouse enable configs/x86/sysconfig.cell' my system 
just hangs. Before hanging, in the log I can see the message that 
jailhouse has been successfully enabled, then just death.

Any hint or anything obvious I'm missing (i.e. some kernel config, ...)?

Thank you,

[0] https://termbin.com/xaoc
[1] https://termbin.com/ntp8
[2] https://termbin.com/t8dr

--
Carlo Caione

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/1d8841cb-24a8-f75c-9157-d03776cea4af%40gmail.com.
For more options, visit https://groups.google.com/d/optout.
