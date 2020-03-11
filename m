Return-Path: <jailhouse-dev+bncBC76BKUBWEKRB35GUTZQKGQEC4QQYGQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x338.google.com (mail-ot1-x338.google.com [IPv6:2607:f8b0:4864:20::338])
	by mail.lfdr.de (Postfix) with ESMTPS id A868E181E09
	for <lists+jailhouse-dev@lfdr.de>; Wed, 11 Mar 2020 17:36:00 +0100 (CET)
Received: by mail-ot1-x338.google.com with SMTP id z62sf1578887otb.0
        for <lists+jailhouse-dev@lfdr.de>; Wed, 11 Mar 2020 09:36:00 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1583944559; cv=pass;
        d=google.com; s=arc-20160816;
        b=fNhwLfS23QEZ465bZFgxofYUUxry5DFLzbVp6ZaNcPTzNj/t6zYtYqdrBe2ayLsmUP
         nRNL08iAqmGas+5ZRAscwW7u3/d9QX0IYEBForus3neujPyEaEgx0bCm2OV6ie6WA9/D
         uPJ24i8Qjjfh1VY5/1jga9nmdnYujxOUM6HXOdGUdNRKVZUh5gw5aSE8FU12WX0yaCfB
         gRoKpvsj3yGAl2xMdrrwc4ZiD9/uUlVbV/y2cKW052rEjwdGraD5IUSLAHuXchdnL+zl
         mVL0Ck5pSoWusnfcUFanyeUEyqdNSmn4U7K4sp3hnpMSZ3R3Bc1c0tGpvkmZn42OtNal
         WUwg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=dun6g/d8depjg9zgzVY078HuPL7fvXVJp0DRr1paCRA=;
        b=MOz/wfnF3bHWqsh8eOvuxS5kyotPuEuSBrD6oMRXnc9YjmRoGI8V1op5QvvagjrlDJ
         aT4aiSf48mMrJax7E/P04dDKLFHtF3KuT9ujRo0TEKB0lKVnYXN3QYU4cczJTxp3Nber
         dAAaSKvxGJKx3yvAviJtLIB6cCjdNSOnMr3rv69Waeeiz3swsQtqwSwtLkGHjRlg0hV6
         WHlq0oo9Kh4gxvbYrYvBhLb6uDdkm9UsODrWqDJ3RiAHjMs475sUVm8NmOK4vUwZegLa
         xjoKKDIaDnzmNnBvCX6WsRdMgdrfYYrgNbpyFbq51GJBEdZkVbUY2vrbJfh3hteg3nyP
         Qd5Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=I9weIetB;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.197 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=dun6g/d8depjg9zgzVY078HuPL7fvXVJp0DRr1paCRA=;
        b=ZfRNMTwh6NilzclKsI22LDVXlhRV1tNXMMUPs5OneKXzZ+kEnIeo04fkv2g9G2J8Vi
         +TbphYHiD9Nc7Kc+0TyDZi9AdU/FpcqiSSTWPndF9qTkG5FPfwgpwoTZZUQy+gSA/dlO
         03HCPKYWQtJ7Wn0Iso9vADXwZhFsLF7p7C1+9gWg9xB+S9n63lYhSW4MEB1lqyJQVbny
         AzoHDrgn7PzFbATAjmd7OaVv15Qg2i7HDN0f3KGK/KtwxL1F2H+u8HvrZqoNOKNhBz/M
         BeD9QxFFCZuZaEXgjWUZ+s7yDrAXT9/NOmMNeB8YjvU4sGdCn0G6G1ZWsFIbBIGWRpxP
         9d6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=dun6g/d8depjg9zgzVY078HuPL7fvXVJp0DRr1paCRA=;
        b=lrJS0C2P9GXTSiWaeGZW3VN53d8475EnQTg2CNdYRuaDQJMoM0o+Ovsf2pXcJe1nh0
         CDMZhwpDfBm6/Ta8h3YVx5ziOhKBFVJq/AQmSwSfRacfyc9ABE5546JywUJ5CVGDR3hF
         DzQrXeCplwn/ToTCRhSCJwj5Ji3VY1Rl6P3etmSn7jEyEDE8ZbaSwxdNhrhY0xHR63ic
         OOVbVYat/Qcqhf3S1DOi6e1iBuwZIl+EQ9qybTb01S2bl5CmaEXiy4FqlVJCh8qzxCFT
         ARj6YooUCDiAL+SpFeIs71h/e4AYtq68RYKkdMNwucj/C9ScYq3D5OLaxWw7OMaLsbgW
         Ep/g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANhLgQ0wn8kCWfwxgDbTFRw2oqAfmXNYYRhgggKISI/7hd8R777jYfU/
	nD/ulrn5JHmw9dGgF3aNPjk=
X-Google-Smtp-Source: ADFU+vs4ebgL1VbN65JAqRj82J7BTU5L3vsUmjIuWVyrBE6XVhAk+li0HCXWbMm5h5mNWfol31YREQ==
X-Received: by 2002:aca:4710:: with SMTP id u16mr2446786oia.108.1583944559293;
        Wed, 11 Mar 2020 09:35:59 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:d0e:: with SMTP id 14ls618584oin.9.gmail; Wed, 11 Mar
 2020 09:35:58 -0700 (PDT)
X-Received: by 2002:aca:ac89:: with SMTP id v131mr2598000oie.7.1583944558698;
        Wed, 11 Mar 2020 09:35:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583944558; cv=none;
        d=google.com; s=arc-20160816;
        b=E9h1/gmKi2smU820YKppjbmOJQu0nybGLaxDENeNZmGtPMA4tGhs8fdxy+YZyX5FUo
         BcI/b9Hc4QfKFHWQSzwDjPAfLHG4V2osbk5VSH5krr3/uPwGWA5o6y2CuWPQpMHbY1hy
         bCiK2xF11ED49mT4IA737NtH8TDE1aHejSa/nVWzn1qt8gbW5J+xp3plv6r+dDkVrK4l
         F1rECHKPTSUagVzVMBRIZaglz7/GSC+548H8k+ZIine8+ejFheCKojtXXJKKe7F05VjR
         bECmnszFO+l7DbXNlSgtah9z0wghf26oHdPC7ScJqRgUIUy9u9jOxEufoGKksbzckUrL
         BZog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=QxGP4PJ3A6a8wV6yisour8dVqFmAsKJdiZpY/c+PATg=;
        b=p2pPvRa0n7k2Od6PbF2nv54f87gE2BYfmHbHAUreeSkJoHwdBrZrzpY///Elvso2fP
         crla+3C098T2/WMTGVETjTiE0Ma9X1Z0EsYQ/5fMaocQ1HbUlVJG9dQjmxfgkgheVI54
         biXaTva3quvtlFgQRnG3HtoWgvYW5Zny1nWeHU+mWv8UgSwmfxTfFY0SGf2AOxDtDxjH
         ETeBZPXz9JNozUptd03ovgXoWv5vlwrd8HbJIM8QC0uz9DSVi7FcucGBsfH3agPf3oIm
         U6KUm68jSJv6UKpy90cVd7qCWq3mKtrVnjIqpH7S3LsOCVoSES3mU1+l/zTh6hfCLata
         CICw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=I9weIetB;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.197 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-6.smtp.github.com (out-6.smtp.github.com. [192.30.252.197])
        by gmr-mx.google.com with ESMTPS id b2si143615oib.5.2020.03.11.09.35.58
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 Mar 2020 09:35:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.197 as permitted sender) client-ip=192.30.252.197;
Received: from github-lowworker-f045d1f.ac4-iad.github.net (github-lowworker-f045d1f.ac4-iad.github.net [10.52.19.54])
	by smtp.github.com (Postfix) with ESMTP id 47A441C1B80
	for <jailhouse-dev@googlegroups.com>; Wed, 11 Mar 2020 09:35:58 -0700 (PDT)
Date: Wed, 11 Mar 2020 09:35:58 -0700
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/wip/ivshmem2/048806-000000@github.com>
Subject: [siemens/jailhouse]
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=I9weIetB;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.197 as
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

  Branch: refs/heads/wip/ivshmem2
  Home:   https://github.com/siemens/jailhouse

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/wip/ivshmem2/048806-000000%40github.com.
