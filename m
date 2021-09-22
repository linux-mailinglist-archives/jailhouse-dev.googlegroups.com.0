Return-Path: <jailhouse-dev+bncBDNPJEGU2MKBBQMEVSFAMGQESTARGFY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x137.google.com (mail-lf1-x137.google.com [IPv6:2a00:1450:4864:20::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 85CAE4145F5
	for <lists+jailhouse-dev@lfdr.de>; Wed, 22 Sep 2021 12:15:30 +0200 (CEST)
Received: by mail-lf1-x137.google.com with SMTP id a28-20020a056512021c00b003f5883dcd4bsf2328527lfo.1
        for <lists+jailhouse-dev@lfdr.de>; Wed, 22 Sep 2021 03:15:30 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1632305730; cv=pass;
        d=google.com; s=arc-20160816;
        b=Y++/beYIn9ICwWr5XoVz7mI2YW+XhTh5CG1r3YnAbrfML22I7OzvA5OFPNEYTeR2hT
         1biP5KnH1rg4foHmxOb9JRbo3PgDQNNCoGs7ANSMyeaFzAhY3QdFsSq3uqqH9dPvu83+
         97Pu5U4bnDnd39nD9uEAocF1vgd3q/QbdsTn6Ji327GUxIV+MI1xCrdAamxk5ba9kDjL
         M/yg+hdyN7YcZkHaT/SdYMfHEYszCwPBaYvO7zCmgKzJx4YhlLVEFKVmTA3g+BKJ3YpS
         IVS4VuDn3dpNEkRqx8CITDILYaWN7CViWkhlAgXLZi3xU96RuP98NteK/lYkYqW9rq9r
         q/jg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:mime-version:date
         :message-id:subject:from:to:sender:dkim-signature;
        bh=WgT1bY2USpGB86OyL+ot9io6sydL+zQtZ4lodwj+1Ow=;
        b=sSKQ+RVzHCKcmt7LWBE5Sy/YEEf1V/82Sho3PeSjEVwcMtfyyCcyCoTyJaTe+Vi5W/
         uG9J40URQD/ACtp6EVzy1EhKAGFIUUJK3KMdWq9PnHY+mmtEcLMlXF7gwPYy/X0fem7K
         4j83z2vvoxW0fqY6MV1tIq3grWmI7oSxDXkKEzQEJ1LZlc+2hi/5Gl+5TnZOBt15Syc4
         oNNcYUmWf3Q2qLRb8gkPJH4RHYIc6Elbrw0rTfAOlSj/7Wt/a67r1BjNxpS1egLRmXmS
         jnGe19LPS6G5KtZ07OQIETpHH6b0UwRtHYSc0PVYWaXF1RCtBqDkUZx/6iX4m8KDH5qg
         CIPw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@linutronix.de header.s=2020 header.b=p6EHDzoJ;
       dkim=neutral (no key) header.i=@linutronix.de header.s=2020e header.b=HbA271eg;
       spf=pass (google.com: domain of martin.kaistra@linutronix.de designates 193.142.43.55 as permitted sender) smtp.mailfrom=martin.kaistra@linutronix.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=linutronix.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:to:from:subject:message-id:date:mime-version
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=WgT1bY2USpGB86OyL+ot9io6sydL+zQtZ4lodwj+1Ow=;
        b=pu160m79eCOsFo82uTBoZiyerU9glzvuQRBx08sNGzpUD16LwmTTetYB0LEQbJrwPB
         YsYovsLAPVh0RJsdlnuTkWykixaGS7tzyGCh4tgkon4eXmo3abw2FLxUpl+tSMZz4317
         iuDIyl5jj2ZSwI/fu0kFGWvQWaBVNU1SRorYXYUZud2JkKzFruiVyUA/a59Pahn5xIsa
         zfzU3b3P5jQUos5TKQFb06CXcPRnlk8c71B9acOeP7wqJ2w2eXMOcDi6ufnbahoh0wRh
         NqAxSWB28UGjrIBQB9PrZThjfMROWu17UcR/E/58SyBeeWuucTiwD/6uopO2eWe32KIg
         BV8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:to:from:subject:message-id:date
         :mime-version:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=WgT1bY2USpGB86OyL+ot9io6sydL+zQtZ4lodwj+1Ow=;
        b=kESlOMt77q9hpkYOVHhMX7zFrATx2t1KSF+efdThR2FZa75Hl1OWM4A1SBUUolIezT
         saQiDmCzyYVK8vnTeESoNrEpRbZCw18p3XPQccz1s8Vnd7SHTqRHBQFyd7i8sW+tQ2Bs
         s9k6ZD4ll+XgiqZxD36/Re6BvHEv0dSQK51MmstVqmlo2I8Wjihq0HqIB5ZaGTWftJxz
         yKbBCNtNt3+aGutnnidx40zXIx+KcY65oIRYE7p8UsS+5Nf7RzK8UG4B6v1PVyXxL3Bz
         PKW2KcC+IS0g0B6CptlpjvHdW8yFmtXMJeB422BIYIgyWh30LaAn9cWpIaEuo4/4srKu
         OS6w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530KXKx8gwLRfBjiSI34SrcyvGrXMykYLHGuE1vpvoMFdyeVOMtm
	piH5AYrnpU9dobbtKjQQaD4=
X-Google-Smtp-Source: ABdhPJwPqPCxZ4+fUcdkn69kYn4YHSXEHwQ3sJI1mFnFUYrrZ9K8kn+J8qxalA2pAjLb2lfYaMbW2A==
X-Received: by 2002:a05:6512:1196:: with SMTP id g22mr25961553lfr.449.1632305729980;
        Wed, 22 Sep 2021 03:15:29 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:261a:: with SMTP id bt26ls63810lfb.3.gmail; Wed, 22
 Sep 2021 03:15:28 -0700 (PDT)
X-Received: by 2002:a05:6512:68e:: with SMTP id t14mr10110627lfe.156.1632305728767;
        Wed, 22 Sep 2021 03:15:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632305728; cv=none;
        d=google.com; s=arc-20160816;
        b=rcU0ImkTRt6VFrb6Vc2ytcVuGxuJLincRuC0wviPmpJkh/nI44em/q7hzkI8IMuJzK
         wDgNv5hUAbzEDIC3gnSkN6tv77v8ZtSLYtYsw5Na8jjFp3BzS3B5DSQZVPstaQEGNUEs
         5yD8cQZA4QACZwZinY9gui7ZW5JpACQSWlVbOKd/oQNWeK4nnBfmvMSUjyhisBpi84X0
         /lSJq5ivnmvafHO2XXfPfO9fkG4xmIpNmsTTomnTXALVijvF2+nOgIYMAp9cNz6KCnJv
         fvLoQdI4MYp3zySrMtS+O40su1JDlwnsr4oFxUzhhhHdc/sdJ+ijfFGNVCFohCQnavsa
         976Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:date
         :message-id:subject:from:dkim-signature:dkim-signature:to;
        bh=3ESmHkI8GhsIzv6h6DY/CYI1JJoxPxwxQN/Py8FpXIk=;
        b=kfoMMqGREzu863EK3sNFOpZBGWgYGWc6bPcUJFwMQ77oDmQ13GMbBFGRdiVwbXQepT
         owtRlcPrMqFeFBV0PWfCx3G2MBO0QVlUjR0xEzO8N5QgYjGM5v4yaep9qLeRwnsCfHoh
         M7w5rlVfKOXLkEm7ydOAl4NSCHUN/I3+caDmrMQ4fddEk388iZx5+1yhheaRt25ScaQl
         +RSHfEOW5IdxD2FKFOl8u+gCJZgFcVhjUbsuKgMI+DTskDcAgOTdEESeeo9tDzF3Jwp5
         oBzBU91+L9aqEiLjBQx93XeJ+9ZgqF9Dc/2LV0Tzu321o9Uy+sAsFDHg+zash7mJ3NWB
         fEXQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@linutronix.de header.s=2020 header.b=p6EHDzoJ;
       dkim=neutral (no key) header.i=@linutronix.de header.s=2020e header.b=HbA271eg;
       spf=pass (google.com: domain of martin.kaistra@linutronix.de designates 193.142.43.55 as permitted sender) smtp.mailfrom=martin.kaistra@linutronix.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=linutronix.de
Received: from galois.linutronix.de (Galois.linutronix.de. [193.142.43.55])
        by gmr-mx.google.com with ESMTPS id o4si103164ljj.3.2021.09.22.03.15.28
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 03:15:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of martin.kaistra@linutronix.de designates 193.142.43.55 as permitted sender) client-ip=193.142.43.55;
To: jailhouse-dev@googlegroups.com
From: Martin Kaistra <martin.kaistra@linutronix.de>
Subject: cell create gets stuck on zynqmp
Message-ID: <2ee07d25-ca98-8cc0-3299-3a393aa99fd8@linutronix.de>
Date: Wed, 22 Sep 2021 12:15:27 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: de-DE
X-Original-Sender: martin.kaistra@linutronix.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@linutronix.de header.s=2020 header.b=p6EHDzoJ;       dkim=neutral
 (no key) header.i=@linutronix.de header.s=2020e header.b=HbA271eg;
       spf=pass (google.com: domain of martin.kaistra@linutronix.de designates
 193.142.43.55 as permitted sender) smtp.mailfrom=martin.kaistra@linutronix.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=linutronix.de
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

Hi all,



I am currently trying to bring up Jailhouse on a ZynqMP ZU2CG-1I board 
with two cores. I can see two different types of behaviour when trying 
to start on of the inmate demos. Sometimes everything works fine and I 
can see the output of the uart-demo running on the second cpu. In more 
than half of my tests, however, the system gets stuck after calling 
"jailhouse cell create inmate.cell".



I added some debugging output to the hypervisor code and I can see, that 
it gets stuck in the loop while (!target_data->cpu_suspended) in 
suspend_cpu() which gets called from cell_create() ->  cell_suspend() 
with cpu_id=1 while this_cpu_id() is 0.



In these non-working cases, check_events() in 
hypervisor/arch/arm-common/control.c doesn't seem to be called.



I am using Jailhouse master and a kernel based on xilinx-v2021.1 (5.10).



Has anyone run into this before?



Thanks,

Martin

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/2ee07d25-ca98-8cc0-3299-3a393aa99fd8%40linutronix.de.
