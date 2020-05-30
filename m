Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBTXCZL3AKGQEKLJ26VI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x237.google.com (mail-lj1-x237.google.com [IPv6:2a00:1450:4864:20::237])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B46C1E934E
	for <lists+jailhouse-dev@lfdr.de>; Sat, 30 May 2020 21:17:35 +0200 (CEST)
Received: by mail-lj1-x237.google.com with SMTP id f25sf431737ljo.14
        for <lists+jailhouse-dev@lfdr.de>; Sat, 30 May 2020 12:17:35 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1590866254; cv=pass;
        d=google.com; s=arc-20160816;
        b=x0JK2F7pHrNYpCtOap7IWkwnWE2eeQnYYTzXMF535P2/7TjDGIrtew7H32SyeL1PU9
         8Xcg0ODh0BZQx0OjyPCpC2QfJCiYy9a6SuraBpdVnfzi+PiZ2YloU4OfaP0pplxp13T6
         gIWJPsZjGvjH+8PhCdqdYeHVyQwTpmQBBpjaFXHFHUJ0gTNozWUwBM/URABErHRdlHiS
         DP+nXQvHWuPoZ8cctjDKvTFeNXXM40781W2nSqj+kVaPQhV62cIqi2t9NC6tDTHLM8Za
         wvxR1+6DToDl2aoKpctyXmXwPTcxUKHUyq6D9adFv2aIVW11WA1jiwUN0S5UfEl8FEht
         1zFw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=Eeu+2gOsFNWeE33hiAR3WB8PHnP9xcvZs0IUuYa6Wpc=;
        b=C3M7XaklCCCC4QnO8uTMWvcyBIfphV7782TKNdAGdtXAKrHlDmibHGd1F5pkQD+fhQ
         cgkvkdLnz0B448U2NoW1nb8Ed3Id6fCYOswVHTviiCPtPCMb5jmU4OovXlT/3IDQSW+W
         TKOD+3tpW4yLigQtKa7aGbuUoPU4zISanADzgznzFXc0jgOEYMfwZLyE+2SyExdTIyE9
         3RvJAu99lcFTAHkXX9L0eMg4C0tHxXPnQX1syrdWtraND56Na/hkNT/x5UgAqIjqByaT
         sFsXeulpYsvV2rzRC1Eh7gng5gBMFL5bIshfClj4SPYJoiqVtxWyOrOKf/LSA9qc4Led
         AtnQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b="WW/s21cU";
       spf=pass (google.com: domain of noreply@github.com designates 192.30.254.195 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Eeu+2gOsFNWeE33hiAR3WB8PHnP9xcvZs0IUuYa6Wpc=;
        b=C0RUeLIGsmGg4l+7MAjCVOsYd5egAPdV4UVelh7ewsBFXJVn3PRVcw+02S58DkvXz4
         URI7M2QAF99oI0WOsEbSgXSDgok03W1tVx0EetPQu0YnMWrHI+m7ZWZV7/J5NUqH+GaR
         zahYi/cIJMAnW5hqQ5cTvJj4TnLFaZzpfYqn/p62DdRyzs7R/5XUcKQnp3dk3bjfkAjN
         IXDdAb0v6tzyWfnNTK9uH2yUz/LHBTHUYRCNm5RtJRDFAgst4Uc1hNmUUy/T3rPOrL2B
         qMne9Iz4yAUjWBXelsEYT/NsKL2oKGo9VmkGBgijDmBZjdi30m50qrCvHv0bEEtWoFXc
         8IjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Eeu+2gOsFNWeE33hiAR3WB8PHnP9xcvZs0IUuYa6Wpc=;
        b=DLqQXcjL3/RM6mKl1Tp0Crctq/qM8BRIEuGGVrr8e1sf16g3yHj4jDNfGuy5JbJcNr
         yqqDfersvJ3zAS1L+63iKiVUySkjvhsyZLYG3YOx6e3EN8dG9K1xsHgBU7/d/bPf/sTO
         XUl7NkH7T54+aSdZRUC8TfUqvjc7FSx/oS9eDHc2nVXEiJfytEaJqRVfixCghLzZuhMt
         EpI/11zQZu/FpmvNH9gkVn1RWEF8cQjHhVahsylTVgDTMaqc++MCHQNkjLrL6WecjTOj
         7U8F3P3WlWvGM3nA0HznQ3x1nnOcaqmbhaSum1IvMYsn81ItHvFP7U0rc7lf0WwLIDtR
         /FfQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532qPPvR8X8wfq5CXctkK8eHTLXU9ZzonA+iQTHnf8AlvFqz8/8f
	sOef1NlVhKNMx2AIoWzDgK4=
X-Google-Smtp-Source: ABdhPJyiNvFisSdLG0IRs+jjrs6ztVdmIOoH2/FEwPWIPYITYf9AU4qdMSPTWYA7nDejt7YaBvcspQ==
X-Received: by 2002:a2e:910c:: with SMTP id m12mr1809353ljg.332.1590866254679;
        Sat, 30 May 2020 12:17:34 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:a175:: with SMTP id u21ls655434ljl.2.gmail; Sat, 30 May
 2020 12:17:33 -0700 (PDT)
X-Received: by 2002:a2e:8186:: with SMTP id e6mr7391664ljg.252.1590866253764;
        Sat, 30 May 2020 12:17:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590866253; cv=none;
        d=google.com; s=arc-20160816;
        b=HF/5TiriGj4h2ZT6HpeVDrhCyKVNEn3qh0/BU3sRg84tQEIzBf3tdEPMW+QWszUNbJ
         /GdF4H8n7h/C3DZMme+JWzsm8HRWfVMbWEqHaepGEyU1nZZU9rbCDwFK0YLpJxoHySzu
         O5aFVoGbZ3bUwqTpzxs0QUjRAfzjZf80H1KQu1Qtr/YNuz1wbcDBtG6IdKZiLnBYZO6q
         H95OXwC6XOYi8L/m13LlzXLeWvwoH63QcrvyTnmMuNbUZiI5GchDbvjyqLuA/J8S2nBb
         QE/NULGmKaL/pRdJTDMgxvkxbDa+gTTqekPZogTVJ2+fG2A5I61pFjpOfH78M3A40NBk
         /6Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=hH7EqgfmbACTmbn5NwNv1L5dzWlRl96rLf3ct86vVvk=;
        b=Z0GUUf97NmZPITiLuL7hYRQRlPwit2Os9O4q/G7ZQqq5P8cb9bEgCLKE5PntETZXpY
         68ljrcYZR49Cb9zkbaYFu8WhF5K+RldFjWiluItMYeS++PFUQERP6pigdu5rggGQsqCR
         2xjddyS6kgV3FWlMi4JY2ZOfNB7xuE53rMlsHVU+yLTqnVf2B5/GwVguDAevL7uwtx3j
         x5ZxchT7zzLeQJLKURYbdg+c01igpu4j3fMPdGBFF9T2A8PopBslZXPscgJZKh/Pn511
         RAQ9OoLlzA0UActkyp5EQLl78/NAPwJEQil9prIgb0gI2MVZexmGOMMCgknBRVwqsLcQ
         ZFPQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b="WW/s21cU";
       spf=pass (google.com: domain of noreply@github.com designates 192.30.254.195 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-12.smtp.github.com (out-12.smtp.github.com. [192.30.254.195])
        by gmr-mx.google.com with ESMTPS id o10si656331ljp.3.2020.05.30.12.17.33
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 30 May 2020 12:17:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.254.195 as permitted sender) client-ip=192.30.254.195;
Received: from github-lowworker-edec459.ac4-iad.github.net (github-lowworker-edec459.ac4-iad.github.net [10.52.18.32])
	by smtp.github.com (Postfix) with ESMTP id 82381120106
	for <jailhouse-dev@googlegroups.com>; Sat, 30 May 2020 12:17:31 -0700 (PDT)
Date: Sat, 30 May 2020 12:17:31 -0700
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/a273e2-15169d@github.com>
Subject: [siemens/jailhouse] 15169d: driver: Account for changes in kernel 5.7
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b="WW/s21cU";
       spf=pass (google.com: domain of noreply@github.com designates
 192.30.254.195 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
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
  Commit: 15169df2990fcd836f6488eae58b290a709b1d4f
      https://github.com/siemens/jailhouse/commit/15169df2990fcd836f6488eae58b290a709b1d4f
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/a273e2-15169d%40github.com.
