Return-Path: <jailhouse-dev+bncBC76BKUBWEKRB2MP3T6AKGQEGMXFJLQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pl1-x63c.google.com (mail-pl1-x63c.google.com [IPv6:2607:f8b0:4864:20::63c])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8562993DA
	for <lists+jailhouse-dev@lfdr.de>; Mon, 26 Oct 2020 18:31:23 +0100 (CET)
Received: by mail-pl1-x63c.google.com with SMTP id h20sf6612914plr.9
        for <lists+jailhouse-dev@lfdr.de>; Mon, 26 Oct 2020 10:31:23 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603733482; cv=pass;
        d=google.com; s=arc-20160816;
        b=cMznY56y1NT4DDUnjuog+1bzAgwmLTrg1NXodwDN7Xv4lTvbpc22ljQvpwyoYD4lYC
         zybh1ExYQ/ODps9m8n5aF+Kp/9uve7htvOG3yYWHIy9n3yIvS+awXAjIJgxbBahTPwww
         AiK3Y+GBg+gvGF/BMRxz8qYkEopy6NrjKeGgULb9OxNHizMIxwH0UeoiOiwFbjJjRpbU
         CbONc0NbujvhmEfOd317QH3JAMbdn7+L/m42PpFZt4RpxOVnUevYvMs+FQ3RaLn/sGUy
         Z433EAWkXNTAKph+rFDip672Hug7v4RoOzyc3x3f8GkFKGqL1RpNIsFmarPvzgEkuJoL
         2n6Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:subject
         :message-id:to:from:date:dkim-signature;
        bh=C7e8IKhtujK4FD8Gxr9p4/xzDqAiDol6i4TUWYB6g7g=;
        b=ZNSb7RPX/DQeKMq57WvEOJYnpJfLvqw44Hm88ojiFmCw3ZMSVwiVunHLJbOrBXB9Gz
         fcVOXlHRlZoyKmMF1d1hqQ9VXGZvj8ebDzO6EOGbPj29zClGFrjojdzVufjuJTJMcO8J
         XOfyHjRwDhw4tK8yl9fUOxOG/srmr7Jaz7S6aFUfhz7D3thufhbxEzWqSTsozlyJvIZL
         4V5/E7ta3pbn68y+yh8CLyvWs7nXhteCN+CS45DyOEjmTovfe4IabXRUjzjCBDmcQ5gu
         o1ydqVMSz4ui5XsFs4I8KiXiyO6dvfzGKzOFzjWXbnrNahXVArmrQ1wuHbTnJVrNTMXo
         gZLw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=tBid6HfJ;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.211 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=C7e8IKhtujK4FD8Gxr9p4/xzDqAiDol6i4TUWYB6g7g=;
        b=KlBW1QAZVNxiWvSztGuUwirLvJAdfW2YI9t1nPw7PrhkP3FUSkrTTkGHZUcLY6H4Hh
         KkQKVr6aJgazcODWwFJZBaJxhAoR8/c+CpbJCpp/vOnnOomRESBCKgqzhNPzaD1vca2J
         hzPFd2ZaQsekSxhV1H0rIpJEtrepue5hyt+fD3QTKXr4Mi89nRNrfaPnUnTF/Abe1Qdw
         2RfarlYpPovbjCrK2Jou9VfK1mVsM+xvD9phTF+rYgy8TMsnEwHjBCq5o7wgCNedHaA6
         g6msh2YZAg4tOTwelk8XZKx7JVyl14RSDfwz1DkKL5lLeFkBJ/wU109bh8vTMD1keuyW
         MPgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=C7e8IKhtujK4FD8Gxr9p4/xzDqAiDol6i4TUWYB6g7g=;
        b=hcOVxuhkn2DwLodAOsXXEr5Qfumnl5d3EPUgu4PycUQYPxbwPer3Cn0gqRFB1YuFI+
         2iPAO2sjqyQamRjVAyfPuHE0qeRPlOqFwUS7XaODw/14mZ354G2+eIrAXOcqzUF+DCsR
         1kAj6HBSumG6Jf0CFI0INa6UBsGJtOKfg2qrks7X9lTUzlLlThUsVSyx3BEltA6A7U+6
         kgLiAj1ehkrIIzxa/I27B7l/YBIraqyTkYDfd+BSLvxwpycX3gxFBkeJoOkoIOAU0YFC
         opyOd1inNUmRY2MNYi5WBe8Kkp+QSc8XttPcQa+XzlizfGpPyTJ8na+ArYsBKEYzo2U9
         /NPA==
X-Gm-Message-State: AOAM533Ekxv9NicQZuR5/jiwyBzLQHdNArP85YLEt9a3qHIiskeZblqY
	dugUncOKz6yKKuPyGqryRN0=
X-Google-Smtp-Source: ABdhPJwLaWWxMSe8WymZRHiSFwsWZQ/DLJurZWmuZYSXQkg3Tn8WwzYg9vDwZV6tU/lIWO69RbXiPA==
X-Received: by 2002:a17:90a:fd85:: with SMTP id cx5mr605745pjb.67.1603733482074;
        Mon, 26 Oct 2020 10:31:22 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:90a:39c8:: with SMTP id k8ls4899935pjf.0.gmail; Mon, 26
 Oct 2020 10:31:21 -0700 (PDT)
X-Received: by 2002:a17:902:d904:b029:d3:d2dd:2b36 with SMTP id c4-20020a170902d904b02900d3d2dd2b36mr331977plz.32.1603733481286;
        Mon, 26 Oct 2020 10:31:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603733481; cv=none;
        d=google.com; s=arc-20160816;
        b=iG1rHtkcVEFxBI27eK6y60W1Q7bnMeo5h8ZGDnOme1kwZpp8zkDXaKTjmnIDG7Ke1w
         fEwSt3xWABEKmpSoUW84lBaDFGgSCwUM8ffMpFqTNPKCrR7uC/OHVjsu8P464mH0GjOX
         fd8vI7Viz4glJyLJWyE9R+86vC5+wPMRgG+Te29pFIgcJ76VItQHzTcPUroF56hV8hGG
         YFWP24fyhiph2t2lDrtfQu59GgRyzybWsPcY3zT2BDXn7F13P3Q0JdG0Z4SxTvB3/U2l
         5arI/aQ5sARsqIZ257HF/HQYUDHlmp6e/xC0zldIUgGgVsk9lkOv4m3ytjQuueVrV3GJ
         y+3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=ksWDK1KjRPVa7vn6q4bMMeqf8Pw+5tYo63XZIntfUj4=;
        b=t494qNtqmnAdGxJnEarnQL0MM/THi0w8huFJ+2jLZ3B4rkb+ba+L9/W+TpLVuyshmW
         yVRfG4eHnLSJ9BW/fihVtvaEqtGtQT8pXHh3wj2pndkSSxfnm393TRqedV45oAmyecLi
         +FGbO+0tesGt96oosRqs90owE8LzLr4VEC+S3Ado4zaz1ZYqF5qLJpXLn8rILBvedlHJ
         V+vwJnp4w2KmeknaQZOZpfH9ETvd53Oal/pkR3JTMeikO1ikBXqjUz9t0ABPmFd0ME8m
         OClwQE5RwemQSmjVWde42tHEJ6hB2vBEM/6opn6fPsde1BhBQZugS5ngfNFl2DIx5SZZ
         Egsw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=tBid6HfJ;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.211 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=github.com
Received: from out-28.smtp.github.com (out-28.smtp.github.com. [192.30.252.211])
        by gmr-mx.google.com with ESMTPS id l7si599857plt.3.2020.10.26.10.31.21
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Oct 2020 10:31:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.211 as permitted sender) client-ip=192.30.252.211;
Received: from github.com (hubbernetes-node-c480d90.ash1-iad.github.net [10.56.116.16])
	by smtp.github.com (Postfix) with ESMTPA id 800A4900800
	for <jailhouse-dev@googlegroups.com>; Mon, 26 Oct 2020 10:31:20 -0700 (PDT)
Date: Mon, 26 Oct 2020 10:31:20 -0700
From: "'Jan Kiszka' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/coverity_scan/e3c512-e75cec@github.com>
Subject: [siemens/jailhouse]
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=tBid6HfJ;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.211 as
 permitted sender) smtp.mailfrom=noreply@github.com;       dmarc=pass
 (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=github.com
X-Original-From: Jan Kiszka <noreply@github.com>
Reply-To: Jan Kiszka <noreply@github.com>
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

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/coverity_scan/e3c512-e75cec%40github.com.
