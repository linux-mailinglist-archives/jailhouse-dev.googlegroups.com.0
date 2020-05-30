Return-Path: <jailhouse-dev+bncBC76BKUBWEKRB7O6ZL3AKGQEZ54QKKA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oo1-xc3f.google.com (mail-oo1-xc3f.google.com [IPv6:2607:f8b0:4864:20::c3f])
	by mail.lfdr.de (Postfix) with ESMTPS id 907B61E9347
	for <lists+jailhouse-dev@lfdr.de>; Sat, 30 May 2020 21:09:50 +0200 (CEST)
Received: by mail-oo1-xc3f.google.com with SMTP id p33sf2009567ooi.11
        for <lists+jailhouse-dev@lfdr.de>; Sat, 30 May 2020 12:09:50 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1590865789; cv=pass;
        d=google.com; s=arc-20160816;
        b=M1D1ftd6GPy0703reM3M1m77fnjLrlode1MNf5GzIMEehRgHp042MZ1aN2+5GJzc1d
         XOJk+CrNVMps3KPGWh+y4H/c84Zr7Sckd5I5FPBbmo4ZOVvYiar/iakGHM4hDytbajQ+
         roPKOdjQydhyCPwTmKHhLWnGN7+w9lV+gMgVSF1iCa0GToY5WsgzvokYENVLecZuZgxO
         C3ZxtZTWjUH5o55Usj0pmt/FIKzkCwPTRPlAiAO/kKAZh2LvoTdk6YdJLg1jnY/L4/Bn
         lC1+NyRnsu49K5PPWSKCNHEHYuaw0I1/eAG6LSQHXVFEQOwXl+I3T5Iawt7ySVO1BZEw
         jSjg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=t3VRLbhGzj2uAMse1L3ta6+oX88sJUG81S7hGbFbmh8=;
        b=CbDiiu+aZ0KBTgtgZyBBgzIOnJVMw40zGk38bwAL19hvZtruBbBm15uAdb5+2rI39o
         OgxuyWC5bc5DhE5VbYoZUKlSIwbJC1EpdUBAHo+Sokam+jBalTlP40F1ejWfMm7rIleg
         c4xnJNIczGENB0DXr38gF1HqJf12vg1cebSknRTMtV/ckqw+kW1WrZv9NVS38E/dQxZ8
         V0dn/Oj55aCCvJF7OSCM5hxClxxJP63tQaa/bQk61gG4N1Bc7p9J28S64xTa9zyszYdP
         1/WxiFldlgjEbx7/bgYSMI3/G5W26yW5zmgeuVhXxYdvr2ZzUQHdxgTv/W5SJh9PfoAW
         m28Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=mPU7Aenm;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.211 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=t3VRLbhGzj2uAMse1L3ta6+oX88sJUG81S7hGbFbmh8=;
        b=mBt2iE2uZyvZF6u30bagaHNvl8x3D8H224DS7hvTTMlAOAllqcdF11K6YUMD7kWsBP
         ewtOUMHEYtPl9qeJA/IuG+JIaYXHFJkMkWyMMVZRLAttTS8LC02gY1NS05tde1Zf8vbb
         s5TypHMw8uvm7WEZOswiuH1CnSfDmwoqGIaEjX/cAKg/6FwmCH3oluPpFNz+bs+m2/iM
         +hqrubHULgPd3QPGwAUWK1ucwd6YdwJkM95WWOoXPBalqfh0yhTJPRcusQ9JzsAK+KMI
         SPYbZfJdPnhTfS+9YvRU3EAjLituP+Uovk6b447SdvrTZXEIxcBUOuBYxot7P3dtjLi2
         nnQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=t3VRLbhGzj2uAMse1L3ta6+oX88sJUG81S7hGbFbmh8=;
        b=VFW9W4pIeAJDo8Tpn6nacKIuenuj6kwktYT8Yi1xdz+t0WMWx2cU6nkrZ0GzchVhR2
         vMLAqP5Gh6aNQA5CYnAdwwSTuo8Ef34ipTgGITJi3EvHrQ5VT1APT+0L3YLpRTg48Ms4
         yS4CaoIVi1gzqvNp3w9sbACMXuL27RYuN95yO9dSC3+qgdk1KSzeVOIpHk7dSk2H4gTg
         psPsRl+oy9n8R7BQnUZ7la0O1yn+z4jzPkEcnZ/ww4jfk+4jKLcDFMS9x3bq4vz9KDWQ
         6GV3hksGBNdY5z5z7uNtIrICE/nGgoa1++IvUTK5b5QxrDcnpvWoa7UPyqMCtBVIT0ft
         RuiQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531lx9/Ce17Z2JQqrqJZZA5uKzY4thBu6f5XUPOrIyKmrjNyvR6b
	rP6bFln+HFrlVPOh2mspJkQ=
X-Google-Smtp-Source: ABdhPJzY5irQ7zoE+VHsb+ZKQffLhF2+DUzj5cpwmqXZJzG2WwdvCgP8uDxOP7nY8h0pqTN+muhZMA==
X-Received: by 2002:aca:6506:: with SMTP id m6mr10380609oim.75.1590865789484;
        Sat, 30 May 2020 12:09:49 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:590c:: with SMTP id t12ls681080oth.1.gmail; Sat, 30 May
 2020 12:09:49 -0700 (PDT)
X-Received: by 2002:a05:6830:16cd:: with SMTP id l13mr11346398otr.28.1590865788927;
        Sat, 30 May 2020 12:09:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590865788; cv=none;
        d=google.com; s=arc-20160816;
        b=CywzulEXAByOvKpRGGvmWCSm8+Hlw+0zrBIvswiyBqP3o0XmVC5MaxqkyNzpMWuniE
         FQSE4BOrGYCi2TxBrduBJhCcU+kix12qHVE8D+nyEAAI2TcGygpk5+mJvzdTB78pu/L2
         EwVvuB7pxcoG/X9mVtNDE269TVGpQ3Tq2V6lGxIC3NswmS9gnN4G9zj9DI2MiihUhGgS
         I6GaRhhIKLJ/gDPbxYpZbwse7okkjlOJEK8qdVvg4WUSxxwq221TFyS6qmZoV8wj/Js7
         vwD7hC8lwDLmzgUbEho9/8SOIbPhdenL4hn0/4xZ/xPypXujZne1RBxjfkCm17TiEJ4+
         9dFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=/PNoNK1ySZY8uNP0HwB6/zK7FQa31EBY6Ut86+7uYbQ=;
        b=N/skOuielTkvJHgZJ1dk1pZur/102D2CUA0wqXKqGvcOZWu/SnDE3Gg/vuz1WSY+NR
         o5pM2MSKFTJ5xKkwt/hKo2plSndGyfkxLxHo7MV8+buseQzLT+eWotzosTE1k0cndFcT
         1e+dYjq5sXqPRt6433BMTCr8qfdq4f/wkQg1yChhpvNUl7E7WKAhB1tzC4mTqyTr00HX
         XRzqi95MuQ3iTYAM45Vk4G8fQBSRP/OpM5pi8IoKCmBuApArAVZDTxRGyAn1ckA5ZPSx
         FKDaEg1slhs408XLN6PCqfsEVNjtMQ1vPbFm14BxkXHUMpBwmJlKK7mRKdmwX4Y2hltJ
         gsqQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=mPU7Aenm;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.211 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-28.smtp.github.com (out-28.smtp.github.com. [192.30.252.211])
        by gmr-mx.google.com with ESMTPS id d25si722270ooa.1.2020.05.30.12.09.48
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 30 May 2020 12:09:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.211 as permitted sender) client-ip=192.30.252.211;
Received: from github-lowworker-f045d1f.ac4-iad.github.net (github-lowworker-f045d1f.ac4-iad.github.net [10.52.19.54])
	by smtp.github.com (Postfix) with ESMTP id 8946D8C0F4A
	for <jailhouse-dev@googlegroups.com>; Sat, 30 May 2020 12:09:48 -0700 (PDT)
Date: Sat, 30 May 2020 12:09:48 -0700
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/80e81e-a273e2@github.com>
Subject: [siemens/jailhouse] a273e2: driver: Account for changes in kernel 5.7
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=mPU7Aenm;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.211 as
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

  Branch: refs/heads/next
  Home:   https://github.com/siemens/jailhouse
  Commit: a273e20cd820921cc404e80c8d6ac52eb634d17d
      https://github.com/siemens/jailhouse/commit/a273e20cd820921cc404e80c8d6ac52eb634d17d
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-05-30 (Sat, 30 May 2020)

  Changed paths:
    M driver/cell.c
    M driver/main.c

  Log Message:
  -----------
  driver: Account for changes in kernel 5.7

The cpu hotplug interface got reworked. Furthermore, our trick to avoid
kernel patching for EXPORT_SYMBOL purposes only is passing away with
kallsyms_lookup_name no longer being exported. Keep the infrastructure
for now for the sake of older kernels. We will remove it eventually.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/80e81e-a273e2%40github.com.
