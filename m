Return-Path: <jailhouse-dev+bncBDOKTXXSZADRBCGX3WEQMGQEZFOI2GI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pj1-x103f.google.com (mail-pj1-x103f.google.com [IPv6:2607:f8b0:4864:20::103f])
	by mail.lfdr.de (Postfix) with ESMTPS id 565F94029DD
	for <lists+jailhouse-dev@lfdr.de>; Tue,  7 Sep 2021 15:39:22 +0200 (CEST)
Received: by mail-pj1-x103f.google.com with SMTP id k1-20020a17090a590100b001971da53970sf1683723pji.4
        for <lists+jailhouse-dev@lfdr.de>; Tue, 07 Sep 2021 06:39:22 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1631021960; cv=pass;
        d=google.com; s=arc-20160816;
        b=BwaXwGRUSxYDDGq8CO3OwfuqU5xyBsu6qqOvFBBSAxPzBcvibc6gh3i2u+2vYWATDH
         mCvyVl7/uOLhlgpyZzcbPJM+f6S+4snZUPFM1+kgUvyZM6R96INRiGzVbUI2NJHSRLBS
         5+wNJd2HAfUuG2Zr9IVi9KsGlKdNjHp8dZX66WPRzSeytYSscmKfdQWOul1VaqPr5OnJ
         8z1GsbZnAUXde3PPwUwF2pKmO4F7BOa9JmJSwD2mhk+pcDmy1S5sjMBpieqOmEmbOrG+
         eHAfQ4sdglCZhDDuEI//sgDRFOTKfQqrk/samIv6h6553AxzmyAgo4nJs+YVOFEb0pmk
         L9AQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:to:subject:message-id:date:from
         :mime-version:sender:dkim-signature:dkim-signature;
        bh=VssIo/YR3m1xBIUqMsCBAKMED+QWtwDpZiD/dDegwzQ=;
        b=iDNpSK/c9SSdc/Wv5aL46B7IuFL0SNelELMQg8IyZkgCc7jezHhXblzr5h83mBrbXY
         FjAkrCfXQTqHlxc1kPnn5qrOqimLax9bhf1oq6l4ufsjFg4lN40gyfCdS4N99b4dhtwH
         wTAZrbkhKTZLN1S7E1QbhQmHVZy2XDED+p6Gv3pOzfi8uDMxqDI8prtA7kMSHqsPm8tC
         O9hmOtlA10VLsQKU91CexofMrh6g8At8X5KiJ7qNcjkYQrXn25D3h7CuDdLm++BJ2LMK
         jH3MPU0/lAp/ByV583HBNjRF2NDFtTsH35pJsbY5X6AFh6QK4VBjby2ZxNFamYLQGv6v
         TgAw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=XfvVoUvF;
       spf=pass (google.com: domain of gengdongjiu1@gmail.com designates 2607:f8b0:4864:20::842 as permitted sender) smtp.mailfrom=gengdongjiu1@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:mime-version:from:date:message-id:subject:to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=VssIo/YR3m1xBIUqMsCBAKMED+QWtwDpZiD/dDegwzQ=;
        b=J/9Ug+UmEgok/y59qlZ/+82JbiXtw8HvsxxQ+YaklA0OCw0MuespJ1qBh4q8C7dWHy
         PRzKgNywpmeZnAJUarb3yQG+B4lHJBtrKQXj02W59nte6k9bOOQsT3c/74+Mozk8QrSv
         ypg0uU2sY43JXa+iDVAPyw8V5nmR6ox/6hXyy7J51m4N7k/z7/ACXYO+DK2Y29v+6aEq
         AfOCAtiuGbNXKQBGlSR/hmomUD6HdugSG2jUDeSuyPyfl97AD8H8sn15xFFwE9fXKsMA
         plG/J5/+8JyH+EGASfIuwvh55KzrhyIxXObDWhaH/tvuit+OMWNDMdFymID06aNMRO4V
         j2DQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=VssIo/YR3m1xBIUqMsCBAKMED+QWtwDpZiD/dDegwzQ=;
        b=aADvHmj3jmMk2diauHXfopGG/XZRnrp1eE5GGyN/IzDT/bMrH9CXi1YCMVNywO/6Kh
         Z+NdOLZnVFFHh1zRuPyYJmakJmrJI5UnRXEDgZGTjnxL1fNkWiXKJGuYDYJmZRes5Wej
         DIPFSFN8xkZ8WzjHR2iMc/Pt1kzEJw2GjJq03Qe3D3OeGV7g5jdBG+v+vt2ZFLYA7bxo
         n++42BoCIzu5rFaBlYA+vJGsVYbkIGKUH9f81TGorNv/e7QReWOroP4qmK4JNT8Ps42O
         C2KzGqcTTm+7DAK4DlK6YNANHRohcW78p97OMPox5Bz4ZToMU3mJktVBytpKhEgfbpEK
         +Qtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:date:message-id:subject
         :to:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=VssIo/YR3m1xBIUqMsCBAKMED+QWtwDpZiD/dDegwzQ=;
        b=Xoewm+mlktk9ylPg5s6tgAxgP+Zo6P5JRqj4GjP03itOszH2gdgLkCkbPnv+WDRLWC
         UmFnJ2uhjCZhsgClK5SuR0n3GuARUqlXS3LrhZb4qZ7uemE9odOY+CdIQOMAV3s8HeUW
         sdK+odeVT29O2S2k8Yy4PRTefA3onZf50x6MSzqUM3HVkht2no4elzDd/2M6kmdKc3Rt
         8CZZWhvx7Y4CViwQEUOBXtxfQtuK7uQyOoFsKn37cDWIk65LUbodeKAcdUkYVBbkjglX
         iirmuSzFDSFVOcGVxHYBRjUXZDTXqpdRcSJZstHvEUZrq8iYdQEHQmi0E9sbGliLyLd9
         YyjA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5318p7oKeV2K6K23zzzkd86+vp4MuvrhZbYcGNjylMdnGS/xexXQ
	7+EvwrCFRv/O6w6Eh9IpFlc=
X-Google-Smtp-Source: ABdhPJw3LMlKgRV6vR2UvuSUnUOwwJoW3CcB0x/Aq8ooe9GDdv7ppqFxanMq/gTYw74IbVmSCMb4PQ==
X-Received: by 2002:a17:90b:11cc:: with SMTP id gv12mr4647465pjb.144.1631021960622;
        Tue, 07 Sep 2021 06:39:20 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aa7:8484:: with SMTP id u4ls4048846pfn.7.gmail; Tue, 07 Sep
 2021 06:39:19 -0700 (PDT)
X-Received: by 2002:a63:1e16:: with SMTP id e22mr16893334pge.153.1631021959838;
        Tue, 07 Sep 2021 06:39:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631021959; cv=none;
        d=google.com; s=arc-20160816;
        b=R2ftBneNZe554pfHaaPOtUXmGRqR/ntA7d10a/17phasWLLzu7a0N8eZwZCCmf6FD9
         hSRKYDb7ikDbhs03lewRD/YpNegf/6OSIr3dhGcCZUVwyMNoWm0Zqs3h7LyZXpZNi9md
         Auq2BF+YUroEcKWwOez8vOv5nwJUNJFdaIB+BAoIcJjDOrsLfl3hUX3BOSz/SaG4ohFy
         m0PSBKMSoqXvTn/eijC2926FLpiSCWZ/jOF3dydESuRnSxtr+MgM5AGi16AFsgETm1ox
         SeOfptdF7z5KAqFMMwMEnIXDMzgSs6Cfssdm9BSc6ibIhpVqlm7dFvfp1bxW31RPYFpe
         uWWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=LbIsjgszC7LBSAIMguZV1yPfzzisxjDoLdsHng8f2Yo=;
        b=XkIrkFLCpocdzWYyvutkPo5hQGoE7nzUewO4yAeQv8WkKI5UR5I6xF3irAX0a1d6cF
         csmmSpBYBCxK5bQBbmBlXcdfN0h4n8ZLQB3H+Zy8n1ij5X1Ny1RCrqkMLzRU+XqvgiuK
         p/yBXuIu4uDKCu/SzPLt2n7iFPopqQnbLwJDulWCDU+zOw/18TxY0BWUOfZMVxcgWYCI
         m6VA4UslEaUIbHpubOvwJ1oscNGUsi6eolzIaYNDDzh5C9p+SfkgIyAeWCl1isAt2aCw
         mzfbJC7VvnX3EKInoI/jD3Yg7vpCRx/HG8R+WX9Vn2pT1ZVwucxANzYjXnwTlWU4gajo
         lbJQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=XfvVoUvF;
       spf=pass (google.com: domain of gengdongjiu1@gmail.com designates 2607:f8b0:4864:20::842 as permitted sender) smtp.mailfrom=gengdongjiu1@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com. [2607:f8b0:4864:20::842])
        by gmr-mx.google.com with ESMTPS id r14si875408pgv.3.2021.09.07.06.39.19
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Sep 2021 06:39:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of gengdongjiu1@gmail.com designates 2607:f8b0:4864:20::842 as permitted sender) client-ip=2607:f8b0:4864:20::842;
Received: by mail-qt1-x842.google.com with SMTP id g11so7927031qtk.5
        for <jailhouse-dev@googlegroups.com>; Tue, 07 Sep 2021 06:39:19 -0700 (PDT)
X-Received: by 2002:ac8:15c:: with SMTP id f28mr15719261qtg.76.1631021958997;
 Tue, 07 Sep 2021 06:39:18 -0700 (PDT)
MIME-Version: 1.0
From: Dongjiu Geng <gengdongjiu1@gmail.com>
Date: Tue, 7 Sep 2021 21:39:08 +0800
Message-ID: <CABSBigSdOnywGHkoVUkN599HZOu8g7XYiRLo=_QVRbr1XsqL_g@mail.gmail.com>
Subject: why not unmap the address after paging_create()
To: jailhouse-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Original-Sender: gengdongjiu1@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20210112 header.b=XfvVoUvF;       spf=pass
 (google.com: domain of gengdongjiu1@gmail.com designates 2607:f8b0:4864:20::842
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

Hi,
       sorry to disturb you,  I have a question to consult  with you,
why does Jailhouse not call paging_destroy() to unmap the address when
it finishes accessing the physical address?  as shown in [1] that
handing mmio subpage access.
I think it is better to unmap the address after finishing MMIO access.

[1]:
static enum mmio_result mmio_handle_subpage(void *arg, struct mmio_access *mmio)
{
       ........
        err = paging_create(&this_cpu_data()->pg_structs, page_phys, PAGE_SIZE,
                            TEMPORARY_MAPPING_BASE,
                            PAGE_DEFAULT_FLAGS | PAGE_FLAG_DEVICE,
                            PAGING_NON_COHERENT | PAGING_NO_HUGE);
        if (err)
                goto invalid_access;
        ....................
        return MMIO_HANDLED;

invalid_access:
        panic_printk("FATAL: Invalid MMIO %s, address: %lx, size: %x\n",
                     mmio->is_write ? "write" : "read",
                     (unsigned long)mem->phys_start + mmio->address,
                     mmio->size);
        return MMIO_ERROR;
}

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CABSBigSdOnywGHkoVUkN599HZOu8g7XYiRLo%3D_QVRbr1XsqL_g%40mail.gmail.com.
