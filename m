Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBPPHQHYQKGQEYGU7BVA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-il1-x13b.google.com (mail-il1-x13b.google.com [IPv6:2607:f8b0:4864:20::13b])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE9F13DD71
	for <lists+jailhouse-dev@lfdr.de>; Thu, 16 Jan 2020 15:31:27 +0100 (CET)
Received: by mail-il1-x13b.google.com with SMTP id o13sf16104250ilf.10
        for <lists+jailhouse-dev@lfdr.de>; Thu, 16 Jan 2020 06:31:27 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1579185086; cv=pass;
        d=google.com; s=arc-20160816;
        b=OKhmAABtXv+VvSIZAnzGz2lZ8Fkz2lkbwe9azbCd+TnI2QXWQXcLK9zHeXHwlLwxYh
         2GwV9F+M5hF2Fc2Nhh8Ro85EJPGhP46acVSw6bAe6wve1J/pLwYgrWg+kAzwrWvLEIsO
         RBHGJzrfubhNnH/PZW3zVd5nD3CkatyiOZN2HyZVJX+y8CoXbv1vjqFA5xrUMLdHjbTm
         hnoSnCHvNjAoyRwPyTVrdz30h8Ez1/thz8M+1CZ+YmkwJuYUniRc+UArkveKBvigC2Iu
         l9nwIMiLDe/RXD7ij4793JwkXvX4uFUvpXKVhAj1IoQQ0WI7z+1Ana3F0NRzz1fHUoiT
         MX5w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=/dIfw0e6Ca/ePx/304zRDuUDF1ZEHJzxilsvfztPTEQ=;
        b=vZvixFGGJCCdIwxJYzFr7MgZtRe/Q64leVikk75VOtoG3g3Evu0jWLqvZMluk43MVX
         Hio5dNW3MUz9ZRZoOVAYoyPBfBaBKBlcG+gHRs6zr1ELijdvezD8Vpnuy+sq/F84z+Io
         mopbmqJJLpQFALSobSHAsvh9TJEYoKgFeibscB9lq+FBhHC3R1Ym5R8V2bDDjcasvtHs
         OOdXkRE4hTv7xBkHGnqOYtb0s0/+YQsYOJMqF4NYTcKN9e5JHIBsTJLR5Y3yZ4HNMblq
         f6bBOEG40JusqRK74suPMUStcIOWDfNHKw+jMEVVkz0xnbVdEAe4tgnsQbHxZOwTheWG
         Cgeg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=2ewrrMq5;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.254.192 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=/dIfw0e6Ca/ePx/304zRDuUDF1ZEHJzxilsvfztPTEQ=;
        b=gFupgP1Zb2ypajIRD7kZjLv2xqo+bI+dU8FJVCdj97k0M6cBWNYxes0b4b55SR/y5d
         SJU21w3f4LmWEgqCwqspdJF5tKjmyU+cSyh/W7ZU1YgL7cC1WJHE8Uhl8h4QETkUvUoz
         +3dBalkVoaAiiYExDWgYW7Q2RQyKe0KNNLN46QXidCYB/koMtTy5Wony+Do3WadrvRZL
         sb0lFPnzzqL33+Bj/JqzMAgmYnfhXo3Fq2i/CIcThL/iqqyt5+qjwUbBTb282pqsB4wD
         3X1I55gnUkk7C5d+qJQIbMW7MnnUW41xQVf4WWlCUEKPxaMUWO9exEK8T227mAGdDU+a
         IMuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=/dIfw0e6Ca/ePx/304zRDuUDF1ZEHJzxilsvfztPTEQ=;
        b=ZCNoElNCXNr4ya/SNMk8h9TqZI+08I8CZ2SgY6is+ZQz4M2sPFEnQZzKQHq2i1TG5/
         Z2WYwmwpzutq1y7RzNXQjf+e6dfa4s1sZbtgK1Qzi7zSXIydbg4NwkTwPxHD0x8ABQ/c
         jvEqx8g/SQUiEqbMfil5wKo347eSQck7N+huyWL9RAjRin991J2w56K4SF/Qej7yWLbf
         cvdtVLHjU/vqaA1qkNZw/e5QLCJJSSfqb2vl0EcLzHu4yrlK74vnOAKre7tJ4BPsnbC0
         B9pKYQYONU4EErypIY1ZHj/PVVKOX1WaRidjAakEhcajLe7mlH8Vz49f+DTbYQv+ktAi
         abVA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVhT7js/RWeYSAHk/3CXy4rYuxAn1T/310trfKjjCjGIFFdzr0K
	XARX4St77DNv1qfnQgvyCwE=
X-Google-Smtp-Source: APXvYqxK8bh9YKAdtX7Wox5cj3nNYuYUfYNC2tuSEyvc4k7CLFnm4ipioj03im18H7+b7OJuChjRyg==
X-Received: by 2002:a6b:14d4:: with SMTP id 203mr24603567iou.159.1579185086322;
        Thu, 16 Jan 2020 06:31:26 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a6b:14c2:: with SMTP id 185ls3550431iou.7.gmail; Thu, 16 Jan
 2020 06:31:25 -0800 (PST)
X-Received: by 2002:a6b:3e04:: with SMTP id l4mr17219122ioa.16.1579185085597;
        Thu, 16 Jan 2020 06:31:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579185085; cv=none;
        d=google.com; s=arc-20160816;
        b=iidNzawqGOR403M8ORA1iuze3GTs6Pzrt9k25yHKcGPzkTmee1h/TGG/5hYGqBk2Va
         G6jiw1lWcCKLRTOV+xYjKiNqJtdTYQgw9IRIk1bHeC3l0GLD+nhWyMMn8LYli25WlwJZ
         BH5JF5Kk/q9z34a+Q31J4SP2COn2sxY/ChK5ui5A3t7poQ0QNWXls8LoVaU65XFeaAuT
         p5TSfwgLZ+TVr9hj4w9w3xaYxAgAdVSYAbSrhe6VQgjgUbP54MvYOu2VDARln8olfTd7
         ZvFkOInbreIX3Nz5dhwp9kfBBYbWqrMQO8QpAbcV+3G/1FYFPzeu5ze4UUTCyihS1B0E
         jniA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :dkim-signature:date;
        bh=QPUad8qd8llZdvd+HpMiMbwEmZCDJXpdYZ/hsrorn0I=;
        b=o+m6cQh5kQA4uS0VTEX+NF9yoOORTonkSmjBsmWVEtj4qjhBkvV2+bFNNXT16Fvue/
         PKDH8IuALQMp5itakcRZHRXxm4RtyyRrncB2sn0YoNDmUn6WJa5BB+HPjRMSh8aVtc96
         roWniWALw5n4tlleps/dIATvLUOQfLmcPORxEmGhX+lE4fMYB9PSkjobO/WJ7lW6LNpC
         YizVidPQ9hKFHnG5V/EHFNLDXhrBzjAOMfy5wA/xKzwfJM+aTW/NN6QL/qhnsf0UYTdG
         CG7XgBjB3J+Fhecqs1qfp2cee49qkGueROcEvCyaZwrzEMMMettaeWO9nFlcaGj65+M+
         UXTg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=2ewrrMq5;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.254.192 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-9.smtp.github.com (out-9.smtp.github.com. [192.30.254.192])
        by gmr-mx.google.com with ESMTPS id h4si1207085ilf.3.2020.01.16.06.31.25
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 16 Jan 2020 06:31:25 -0800 (PST)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.254.192 as permitted sender) client-ip=192.30.254.192;
Date: Thu, 16 Jan 2020 06:31:24 -0800
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/coverity_scan/cf0d15-f27064@github.com>
Subject: [siemens/jailhouse] f27064: arm64: Fix initialized return value in
 pvu_iommu_c...
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=2ewrrMq5;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.254.192 as
 permitted sender) smtp.mailfrom=noreply@github.com;       dmarc=pass (p=NONE
 sp=NONE dis=NONE) header.from=github.com
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

  Branch: refs/heads/coverity_scan
  Home:   https://github.com/siemens/jailhouse
  Commit: f2706433efea646a7357cc399de9b24be6253a4a
      https://github.com/siemens/jailhouse/commit/f2706433efea646a7357cc399de9b24be6253a4a
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-16 (Thu, 16 Jan 2020)

  Changed paths:
    M hypervisor/arch/arm64/ti-pvu.c

  Log Message:
  -----------
  arm64: Fix initialized return value in pvu_iommu_config_commit

This is relevant in case there are no stream IDs in a cell config. Found
by Coverity.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/coverity_scan/cf0d15-f27064%40github.com.
