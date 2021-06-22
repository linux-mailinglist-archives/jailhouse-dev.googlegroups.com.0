Return-Path: <jailhouse-dev+bncBDOKTXXSZADRBZVJY6DAMGQEL7GFX5Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qv1-xf38.google.com (mail-qv1-xf38.google.com [IPv6:2607:f8b0:4864:20::f38])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A9F3B0415
	for <lists+jailhouse-dev@lfdr.de>; Tue, 22 Jun 2021 14:17:43 +0200 (CEST)
Received: by mail-qv1-xf38.google.com with SMTP id f11-20020a056214164bb029026bc7adaae8sf11327627qvw.2
        for <lists+jailhouse-dev@lfdr.de>; Tue, 22 Jun 2021 05:17:43 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1624364262; cv=pass;
        d=google.com; s=arc-20160816;
        b=Q4gDSdz/LPzozDHasxtWB7CKpskbsyIlqJwho994N6b85Pr0zGmpAuQBKxS8zkrfou
         q9KE4xR+GVm0uX7jkl/dQAVUrongFXjeFU8j9f95s6tPLFTXh8KJg+bW3qqP+dmf3kAc
         p1IUdzG+K9Ka6lUpMTz9AoIeUhRtXSjbqD5HlwOFg/pBXajKKONZNVPQoMhKSXGSnNDO
         EDjUiJiQIp7r1GLSISa3t3pO15/e7UdhHeRy5vYBdR0OW8LCOFMRex2//WXaNRrsRP79
         OkIf/IJOchaERXLdfVTKe3PIeaC2Q6dob++RnNQBzcBs7SBptD9jWEuSJYcTORDv60wt
         3mcg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=izPkTIKX81ypZRUSD7FFAJdcUGLlqyJTfEFCIk0sRoo=;
        b=qRLNLG0NOQehKgz/+mkZtHr10X5zQmo5hfe6qhtFhGTlYfTac73fMZKCr+jcH4afNt
         jEzoON4UVQ2qBMaAGi+a6UPjQG2/cAHNcvz+HbS4pVxzRTJj0ouT6xFNNV/pauM7cXXy
         /cpJjL4/lhk0Ai1a1O+VpDAGfYmjujak/X2j3b7Iu0y65lQllatxFEkp6DxjI7kbMOz3
         2xaVH36ekzsKKR24MpQrcYF6QxX0yxFMH0bNkM6VuFqfEMsxwWud1YRAJ38siMIIh973
         QXP+Jz9vQabX3WFeKtiA8vtVHdjR5Xe9AMr79MAVe1wKDCzcoOitGybU2ayNS8psjUEd
         N8Ow==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=LjPyo0DL;
       spf=pass (google.com: domain of gengdongjiu1@gmail.com designates 2607:f8b0:4864:20::744 as permitted sender) smtp.mailfrom=gengdongjiu1@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:date:message-id:subject:to
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=izPkTIKX81ypZRUSD7FFAJdcUGLlqyJTfEFCIk0sRoo=;
        b=iAs1Jkj+VE44gxiDI2WHBaoWNrLVJ7UtjbfS/0Ie+KKqs0jOjsULVG6MJlyfbX+UYo
         qUSC/4sQITfiO/104vDSyIs/NKE29XVIbEnKId4efdTRuDJwfTKxmaO3X6tQrtlWC/0d
         YXrvT3jsTmVV5WqrCP81GK7zdMOZixrUoAwcSs+5Mco5+saFF7oTq6+lEm5B6Mzb9Ydd
         0s7pfqV3tOYGB2nJ+2MgLkczLdFz6MAWKOFytmsBFFAwhi0TW+TQbOECmm0hBxKyZSml
         ePqmiX3eu0YuX8G00wTPFKVybr245+YWDrLXt3SNWS+dt9GRtO4V39epwxwLOXCAd7iI
         XUCw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=izPkTIKX81ypZRUSD7FFAJdcUGLlqyJTfEFCIk0sRoo=;
        b=MENOktaITb3siQYzjJjw8cXr16ZR89V1RUMTNXE3wZQ6to6Dv0ixnH8zc1bxzZBxLv
         IsG4xk8v7gvqwjBJoOxfpyIfwHTRsG0fVahSmlkfvxh0xgL/zFXqyI9bPjM+OsZvjDds
         cp4cTA4hYtMY/tTpTImp0VYdU+ANqspToAtDrc68s/Z4eEIP1sFuoiDwC/AmOANgQ1I7
         SruGBcC59hueuI4tzZcAXKvi6awi9GFmmKzx5TFE5v/FBSHEnD7xInCVkrE615as1FAU
         B1J6Ufna/3bE00hEerwUk4u8lxo4QyCBtv9InURsx9N4EiQdUtmBbuW1o4ew5CwMVl07
         NICQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:date:message-id:subject
         :to:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=izPkTIKX81ypZRUSD7FFAJdcUGLlqyJTfEFCIk0sRoo=;
        b=fZUtj00t2wd30R8W+CSHGOoSX70ZwSLoTFgmN9TyqB3vHR7dNSZdPHFYXvaib6fcHy
         Q0yVB5x1Pfcyu38QVv/rsD1ItX18Y4OJFZNM7N/MVtZ9CRb79HDBlR+hIpeVGBoiVnpH
         KzDh4NRr5yKPTsyXb4k1iRBM8aKUPLt7DJ5kVqAczA0WBEJEvP8junPKY/mCfK/8rWpy
         K2/ljLOjwgzR1nSIttwKhsxPixd7S26z1ep1u7hC4YUcUHdSAf+yb+Ey9UGCoZQmv0w3
         zz2ktXQtqfx/CsP3vIfz+HnoHXV9w1JoaQsU/Q2BdRZTAq5ri0H4rJLU1ZwcG/b3FJkG
         HZNw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530sxLlAUoqmrjdp4rOOgoaRbw9DZ1b2JyeLeAw0rgGYZnni4PL8
	Vbl/gOFKZC4kafMtogVsSew=
X-Google-Smtp-Source: ABdhPJzLwGvgkMUXevCHH6MPzWs5RDvFPdSytG/d/poZnqdFdpE2fjbYX8hFT26kZKeSFGWi7s+Xcw==
X-Received: by 2002:a05:622a:13cc:: with SMTP id p12mr3159164qtk.81.1624364262231;
        Tue, 22 Jun 2021 05:17:42 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a0c:c985:: with SMTP id b5ls4471452qvk.8.gmail; Tue, 22 Jun
 2021 05:17:41 -0700 (PDT)
X-Received: by 2002:a05:6214:850:: with SMTP id dg16mr7355399qvb.60.1624364261837;
        Tue, 22 Jun 2021 05:17:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624364261; cv=none;
        d=google.com; s=arc-20160816;
        b=coVmXUsGg8NFTt/qWDYlBlLAoACYpA9AOrJgP4p6k9DvdNAyxo6YkwPsHWO7HcnDdJ
         8T7T4Sk6fa+xnpU2eUVhkCfPzE5phCdiNyqyicRocYw1PXKIS3gVuPriklerXX9Mz/HP
         n2y6UcJCGOqyO+LnrgBsIqYiX60iN5jBf+nRAPSQY0JM623O0Wpjqycnyo2GmGKAHuJB
         JHZ97UW5DkHWlaZtaraJWYTdABuDUhBeVyJtMkg085RMNu+Zl8ds9YR2WqbsBGA68L9R
         +gGkgQY5A9TvYX1OTukmpY90MbE3OhrE57FLiJ7dWRldVW63iC24rsrBf8SezbUUFP2y
         bDbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=fbY7SQ4Brf1/fUptKYEF1/ZfOVQ8LlF4TQ8TJaTUb/w=;
        b=YPXD/NgD6TpYYBpyK2aM3MiRvSC3076Ij3ord6xOrC2nQe7VGo8tJbaaY5GYSAeLo/
         T9Y67zSB0ER9MkGekMcC4Y5IbRs3Jca3YFFrUj1nBT+tABoEKdkOimQFx9HRp7KopafR
         J+LjmS5jDk2u6+x3kLHJuXcLam0A7pTXEkNbIM+E+S7YT0l4HFUy29r7qHKuNyW9gCjw
         7JW/MAUiHTr5E1LZTvqx9u9KX11UTIvySsJNm1fUeJ9i+Sb/9XvIYA+TkMmvfBK0FcVB
         V38FSMJfMpdBjQX6PgpRLokyl3HfeS+Rj6HUAsPEC+88EIyvyGPzRI6lILG7xU5kUNnl
         nX+w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=LjPyo0DL;
       spf=pass (google.com: domain of gengdongjiu1@gmail.com designates 2607:f8b0:4864:20::744 as permitted sender) smtp.mailfrom=gengdongjiu1@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com. [2607:f8b0:4864:20::744])
        by gmr-mx.google.com with ESMTPS id j16si197547qko.3.2021.06.22.05.17.41
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jun 2021 05:17:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of gengdongjiu1@gmail.com designates 2607:f8b0:4864:20::744 as permitted sender) client-ip=2607:f8b0:4864:20::744;
Received: by mail-qk1-x744.google.com with SMTP id i68so38871675qke.3
        for <jailhouse-dev@googlegroups.com>; Tue, 22 Jun 2021 05:17:41 -0700 (PDT)
X-Received: by 2002:a05:620a:6c9:: with SMTP id 9mr3966359qky.303.1624364261294;
 Tue, 22 Jun 2021 05:17:41 -0700 (PDT)
MIME-Version: 1.0
From: Dongjiu Geng <gengdongjiu1@gmail.com>
Date: Tue, 22 Jun 2021 20:17:29 +0800
Message-ID: <CABSBigR3+yvpTCU2=YKYjX-ct-buuCh=WdkF9uZzT8vz=CWaHw@mail.gmail.com>
Subject: adjust_irq_target() for root domain
To: jailhouse-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: gengdongjiu1@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=LjPyo0DL;       spf=pass
 (google.com: domain of gengdongjiu1@gmail.com designates 2607:f8b0:4864:20::744
 as permitted sender) smtp.mailfrom=gengdongjiu1@gmail.com;       dmarc=pass
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

Hi=EF=BC=8C
   when the Jailhouse hypervisor is enabled in first time,
"cell_added_removed =3D=3D root_cell" the  irqchip.adjust_irq_target()
will execute two times, it seems there is no need to execute two
times, maybe it is better to add a judgement to avoid it?

void irqchip_config_commit(struct cell *cell_added_removed)
{
        unsigned int n;

        if (!cell_added_removed)
                return;

        for (n =3D 32; n < sizeof(cell_added_removed->arch.irq_bitmap) * 8;=
 n++) {
                if (irqchip_irq_in_cell(cell_added_removed, n)) {
                        irqchip.adjust_irq_target(cell_added_removed, n);
                }
                if (irqchip_irq_in_cell(&root_cell, n)) {
                        irqchip.adjust_irq_target(&root_cell, n);
                }
        }
}

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/CABSBigR3%2ByvpTCU2%3DYKYjX-ct-buuCh%3DWdkF9uZzT8vz%3DCWaHw%4=
0mail.gmail.com.
