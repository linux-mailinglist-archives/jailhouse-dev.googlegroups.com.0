Return-Path: <jailhouse-dev+bncBCONRR6ZTUGRBS5HTD5AKGQE5IRWEEY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13d.google.com (mail-lf1-x13d.google.com [IPv6:2a00:1450:4864:20::13d])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC7D252899
	for <lists+jailhouse-dev@lfdr.de>; Wed, 26 Aug 2020 09:48:28 +0200 (CEST)
Received: by mail-lf1-x13d.google.com with SMTP id r30sf379497lfn.9
        for <lists+jailhouse-dev@lfdr.de>; Wed, 26 Aug 2020 00:48:28 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1598428107; cv=pass;
        d=google.com; s=arc-20160816;
        b=MzaDBZ6jLFh5KUVpYz3yPSqVtaarqLdrblBuxgt3u8ccwyIF7oFTM3egRcDE1i8SWc
         rLmngsInCbvhTo8U3//doM5H2i0taVOeLg9MiUVeedo15KmVj/32iyR90E31qDqovoxh
         I0nIC12f7LiC1L5PGluvFE/CYciibPe8cQGr6MwDvx+IYk/4wwGlZEqFfWW80MMgUnyo
         FBxeSOF1g2+IAXWHScqOKIFz0zZKV46ahTWzqBo/Q+RfHy2SShmOg4vaLGh31zxunOQ5
         12TumXfHoakdTDR97r/QWhiuVbksXZno45IcV9jst+fEZCUSpNrmMCLqEMKUHo70lGOQ
         nJ6g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:mime-version
         :user-agent:date:message-id:autocrypt:cc:to:subject:from:sender
         :dkim-signature;
        bh=2x5JoHtXTBDaNa0jUl86l43ITqeTx7Vy4p29Hrtko0s=;
        b=WBe+HqRwJnlgegbuFzlwHq5QMyesnfdw65Pt/5317fzREMetf+gDcZEnwfKQy0Whvx
         mb/BvqaL2RRa2mMbSYAUR/i9qCcx+tdPz468nDR206YE63QxP1SdmD0CLzy190hQ0azS
         Ac/27MA2OpK96IVJjizphym9RZJXf8lBxnTAAkEogztvf4CVhdtVnnABe5rpKMjC1YXf
         pFygLws9yziLsNd6pE1sbJW6sfQNh9Rs9HZ6DFRyC/1EWzTpZ4aK+N8gzNYrn6JgzL2g
         iXoFdtH9OxRRyj4+eLmPo/kSRTMjP4es7X7orhJVwlxbX/TddB97+RKds8PteyoIHxLq
         4LQQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of christoph.gerum@uni-tuebingen.de designates 134.2.5.213 as permitted sender) smtp.mailfrom=christoph.gerum@uni-tuebingen.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:subject:to:cc:autocrypt:message-id:date:user-agent
         :mime-version:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=2x5JoHtXTBDaNa0jUl86l43ITqeTx7Vy4p29Hrtko0s=;
        b=M8JtvIlhnMkBm9OA7mluP/RLIlBbTSrNyqJ8wrOAUXeBDrEtVGALDbKINZcTQDESlw
         loR6oedf1innT81EFBwLy/1pF2hvscBZ8h++imou90Chq57SdveYNObtT3PD/Bac2mPm
         wigXIDnTAOAieRCXrVGguHNCCQqaENy+evyEuMvtTwi5UCwRsZjPjFa2Vn+efvumUn2E
         1OhMQVZR3LS0dt3VG3Cg7wkYaTp+WCl2nrhy8InDs/BDQH2GQsG+Yewu19gbCxdlLiyJ
         VDBmUYdVLFRiD178lhnngx46zimgyHFMhcmLv2G02YpOuk0rnvDldV69DLy+QEE7tOso
         Herw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:subject:to:cc:autocrypt:message-id
         :date:user-agent:mime-version:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=2x5JoHtXTBDaNa0jUl86l43ITqeTx7Vy4p29Hrtko0s=;
        b=CR+/kSC9BAmmEUdwpQEkWecGH4f+Gj+e4arqrut+YO1qcZpSKsxnGo4CpBFmlg28Cv
         982e1rDtuJKpOSsTfvl6D5uiCl46Wdm+slMzeNMMOw9HjXlieN4JTWGY/c6THAy29F0p
         efRA4KskDk69zbu/113FqJfHUs+WSnMCubp+qMSPq/0hGJdSRPe6rqVCVK8o2V9KdEZK
         haIdNBGIbQgHkk693JMi708qM5Uf5SKJ4af9dux9DZ/10HCNOiKwFRhyjezkkNDAEEWu
         i07wbDj47LO6iteyDMEmuAi6OxD+93SeSrUsqaCvXACtxEuBdGAq8Ay4DzSmBXl0BQWS
         yEFQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533zxJIEUpzonTg32w6E+ugXCnFiL4/6tsf50QFRT8F2AFTtWdk6
	w/l6ENUmSCJkVOPTYZf2UuE=
X-Google-Smtp-Source: ABdhPJwykSjo8T2fn0RIrmpCN3xVYd+9lDZJ3PKo2h2qro7BfyUxdJdHE4+AR8IRMGwc6c+DZVFjtg==
X-Received: by 2002:ac2:41cc:: with SMTP id d12mr6783425lfi.20.1598428107647;
        Wed, 26 Aug 2020 00:48:27 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:82d3:: with SMTP id e202ls102908lfd.0.gmail; Wed, 26 Aug
 2020 00:48:26 -0700 (PDT)
X-Received: by 2002:a05:6512:6d6:: with SMTP id u22mr6790103lff.178.1598428106724;
        Wed, 26 Aug 2020 00:48:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598428106; cv=none;
        d=google.com; s=arc-20160816;
        b=RBPyR4CkzHbqX3dF3dwDe1XRgtVfGUXMtRGB2c3XZdxztowvU4dyi3aQdnXLZL5A7P
         dYlAqZyOmWh0GLTh/APXDXAwFDgk14EUZzeZJwAtxzlYWzBvtq366FgtPF/OvkcwOa4B
         clz4BUUynxHb2hYre0ZYW9kCEzqNyd0/tF6sJLpw/nojfPD7vAF0n5jEJ3q7j5h0aJUo
         QZlxkf7t5LeSaQiyE19eFiZIjdbMR+Xgra+4QyoN90jsercULbb9nMse3VaogqpjOv4e
         YbTDvEGgWShyKkRE1pxZwW1vCfa7Kj5EebAp6WLnlu25DCFFZWCjRriZBcN8l5HYSJF7
         807A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:autocrypt:cc:to:subject:from;
        bh=acGCNLWbYIJ9dPd00y2eYvVhq7bFdHRX9lOQF4SAp4o=;
        b=mSTmjM8QyDAJMj4SfIVxIqu7UOCHLeEQymR+4aWJJ4sAlUD6s8ZnbFUI6l8fQfhhLC
         4vHE/7579Z3zRP3bQuLNhoTk8VnyWAhzawc58SQOe2OePCbHauIKxCFAEnsm2FHiyC1L
         nG5o1fo0ySx2eakofv09/iXrk54eGL1pFv2QTRKhLP+JS+ZTgR1rzzD23KrUe6GiiflF
         nrXZBKsHGwyGvYX71QGhMoZJyUIm9GvvDvkj6tl4L7Kt4oHwzUbgqengeCKcWi+W077c
         pXt8UXg+ktjma0NPLFsXlqwYwhE4PrIK/4XlpueA7r00AUC7ZxxRq76fhbx39n9b9LSp
         o88A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of christoph.gerum@uni-tuebingen.de designates 134.2.5.213 as permitted sender) smtp.mailfrom=christoph.gerum@uni-tuebingen.de
Received: from mx03.uni-tuebingen.de (mx03.uni-tuebingen.de. [134.2.5.213])
        by gmr-mx.google.com with ESMTPS id c27si67545ljn.3.2020.08.26.00.48.26
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Aug 2020 00:48:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of christoph.gerum@uni-tuebingen.de designates 134.2.5.213 as permitted sender) client-ip=134.2.5.213;
Received: from [134.2.14.31] (tichy.Informatik.Uni-Tuebingen.De [134.2.14.31])
	by mx03.uni-tuebingen.de (Postfix) with ESMTPSA id 28A88831A6;
	Wed, 26 Aug 2020 09:48:26 +0200 (CEST)
From: Christoph Gerum <christoph.gerum@uni-tuebingen.de>
Subject: Sharing GPU mailbox access on raspi4
To: jailhouse-dev@googlegroups.com
Cc: Artur Plischke <artur0997@yahoo.de>
Autocrypt: addr=christoph.gerum@uni-tuebingen.de; keydata=
 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
 T29y/VTnmoSXIbqAbOajhVUuOH67EXAD
Message-ID: <f1889ddb-56e3-abef-87be-dcb2085a0ef0@uni-tuebingen.de>
Date: Wed, 26 Aug 2020 09:48:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: christoph.gerum@uni-tuebingen.de
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of christoph.gerum@uni-tuebingen.de designates
 134.2.5.213 as permitted sender) smtp.mailfrom=christoph.gerum@uni-tuebingen.de
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

Hello,

One of our use cases involves running Codesys Control SoftPLC [1] on a
jailhouse inmate. Unfortunately this software uses the GPU mailbox [2]
(/dev/char_dev, /dev/vcio) for communication with the raspberry pi
Firmware. As this device is needed by a lot of subsystems (GPU, power
management, some GPIOS, ...) it seems undesirable to move all of the
subsystems into the inmate. For now our plan is to write a simple
userspace emulation for the few ioctls which are actually used in the
implementation [3]. But I wanted to know if there might be a Jailhouse
of handling this situation. Just sharing the device deadlocks
immediately, due to the shared interrupt I assume.

Kind Regards,
Christoph Gerum


[1] https://www.codesys.com/products/codesys-runtime/control.html
[2]
https://www.kernel.org/doc/Documentation/devicetree/bindings/mailbox/brcm%2Cbcm2835-mbox.txt
[3] https://libfuse.github.io/doxygen/example_2cuse_8c.html


-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/f1889ddb-56e3-abef-87be-dcb2085a0ef0%40uni-tuebingen.de.
