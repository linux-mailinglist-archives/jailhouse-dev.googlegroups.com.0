Return-Path: <jailhouse-dev+bncBDPPNXPMWEHBBXFD2WJAMGQE2RBSCLQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x838.google.com (mail-qt1-x838.google.com [IPv6:2607:f8b0:4864:20::838])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A024FD5E8
	for <lists+jailhouse-dev@lfdr.de>; Tue, 12 Apr 2022 12:18:05 +0200 (CEST)
Received: by mail-qt1-x838.google.com with SMTP id l12-20020ac84a8c000000b002ed0db96547sf7077713qtq.18
        for <lists+jailhouse-dev@lfdr.de>; Tue, 12 Apr 2022 03:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=X0boMD5jrUrcOnwecI+Vh3k2RoYt8zrUhaK72UJet3w=;
        b=qGpVG6Q1tL/eWnIkxvbs1zW5mGD/Lp0mSy5q9fPzXlOEThRhJ6oMhYbDQAru4qd1K9
         3OmJuJZ5Q7J7oZWKWMq5Pa9erEUX7hRyruQwR2Nuj8L63lV5+qna3NX9VsJrQzMDp7Ls
         QpB/ZxcgyQdOwmCi2yHz1r+w7Q9QkcL2UBQ9E47aOUTRDRvRinwI97eNg+UlCE4EV30l
         gghR+/Z6P13ZyWiOQzIcNHnqOapnvuTKzNq3wpFrPQnuhnCdJg9wXrGlovUyrKCRIB4C
         +04qPIpjt2QSzeZ7mCzKgtX0EMBezvPZrDKZxeVCSeSIJ/aMd4LACBCrQmmg0Tp84rez
         Heqg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=X0boMD5jrUrcOnwecI+Vh3k2RoYt8zrUhaK72UJet3w=;
        b=cxwpriUsBqG5/PthX7Obetov949nynDzOwf/19c1V3Apu2s+XIYPP50gfNzKTO3gV9
         bH7HC5COVvdxYjjSAZsurepW/njxBxKNK8i0mPWp7YQlUI980A8nMANfRTsirCBGjhOH
         FjamuzdDUC+mw/PUNF3Q+Z5sko9zo8BGt7Vl9nVUndN2cT0CpXr+AGZ+R4ZHBJyWrCX6
         slOo4QiXuw6ceTy6FnSPIK7mim7UN43KvduTzdzh/mL2SBSRGm5PXo0ZerTM33Myykt/
         QpUoVBvFPzec61OMNAQCY1wGxSNIfTbLDZWdg9z6yPrfpx7TE10+n6/q+kqFKVT7lasp
         z+PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=X0boMD5jrUrcOnwecI+Vh3k2RoYt8zrUhaK72UJet3w=;
        b=uz2ATTS6C1rSKcZQVmakaCfvhAOkqW1pNagU1f/YDZWqDbGv0+5g5kR1IILiQ3wXPF
         j1UhQomDriZipz+bLogHgmjp/NjrUbzvGNajUXTB79UgoXYOuOnuwo+6SpkgoxkCVpgK
         N/skXnGz79WzkHTa18yd5cOrOub5IwVYeVW3G+cxpiw6AUF9MbjGsWydG4zvtGwTfZVZ
         Diq3ElL651GN6T4B6CdUmwNDl2RKSo/Mx2kg39UalO36x5c0K6RuM3h3i/uGQt39XewV
         7gkB1PYMSHDVIQo+TGyNkIc8Es4MkhJa3MofryecU2oN/7zdzm1zbubXk+zYpmNmPKhz
         X1eQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533LQebba5wHjyEqgzCGifxNfp5E/qQrArTDHHXLFbaJqwjMhbGE
	KJFExvXnayWYGr3QeqOiew4=
X-Google-Smtp-Source: ABdhPJzUqeyLXQhFdFi7Jbf8v0j9uy1x8JBaQcJDXQhsYQvM/YCyiIsMuQ7D/C9GPY99iamRrn6bzQ==
X-Received: by 2002:a05:6214:29e5:b0:444:4d8b:df8b with SMTP id jv5-20020a05621429e500b004444d8bdf8bmr5074171qvb.75.1649758684534;
        Tue, 12 Apr 2022 03:18:04 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:620a:f14:b0:69b:dd23:cc12 with SMTP id
 v20-20020a05620a0f1400b0069bdd23cc12ls11847011qkl.9.gmail; Tue, 12 Apr 2022
 03:18:03 -0700 (PDT)
X-Received: by 2002:a37:9f55:0:b0:69b:f262:bace with SMTP id i82-20020a379f55000000b0069bf262bacemr2480038qke.236.1649758683560;
        Tue, 12 Apr 2022 03:18:03 -0700 (PDT)
Date: Tue, 12 Apr 2022 03:18:02 -0700 (PDT)
From: Andreas Orfanos <andreas.orfanos@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <6740e6fd-5156-4aac-9e5f-1dab6ccb0fc8n@googlegroups.com>
Subject: Cache coherency with the Linux and Inmate
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_536_361725805.1649758682970"
X-Original-Sender: andreas.orfanos@gmail.com
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

------=_Part_536_361725805.1649758682970
Content-Type: multipart/alternative; 
	boundary="----=_Part_537_1333197540.1649758682970"

------=_Part_537_1333197540.1649758682970
Content-Type: text/plain; charset="UTF-8"

Hello,

I would like to use a shared memory region between an inmate and the Linux 
in a way that is coherent. The memory region is a memory pool partitioned 
to provide memory blocks to inmates and to the Linux processes that have 
mmap'ed the region. The Linux process allocate blocks of memory from that 
region for local data processing, and then indicate to the inmate that a 
block of data is ready for further processing. The inmate takes the 
indication and access the shared memory block with a cookie to continue 
further processing on the block.

I would like to keep cache coherent between the inmate and the Linux but 
not sure if that would work in Jail house. Do I have to clean and 
invalidate the cache from Linux all the time when I pass the processing to 
the inmate? I am using a Xilinx SoC with a cluster of 4xCrotex A-53

Kind regards,
Andreas


  

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/6740e6fd-5156-4aac-9e5f-1dab6ccb0fc8n%40googlegroups.com.

------=_Part_537_1333197540.1649758682970
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>Hello,</div><div><br></div><div>I would like to use a shared memory re=
gion between an inmate and the Linux in a way that is coherent. The memory =
region is a memory pool partitioned to provide memory blocks to inmates and=
 to the Linux processes that have mmap'ed the region. The Linux process all=
ocate blocks of memory from that region for local data processing, and then=
 indicate to the inmate that a block of data is ready for further processin=
g. The inmate takes the indication and access the shared memory block with =
a cookie to continue further processing on the block.</div><div><br></div><=
div>I would like to keep cache coherent between the inmate and the Linux bu=
t not sure if that would work in Jail house. Do I have to clean and invalid=
ate the cache from Linux all the time when I pass the processing to the inm=
ate? I am using a Xilinx SoC with a cluster of 4xCrotex A-53</div><div><br>=
</div><div>Kind regards,</div><div>Andreas<br></div><div><br></div><div><br=
></div><div>&nbsp; <br></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/6740e6fd-5156-4aac-9e5f-1dab6ccb0fc8n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/6740e6fd-5156-4aac-9e5f-1dab6ccb0fc8n%40googlegroups.co=
m</a>.<br />

------=_Part_537_1333197540.1649758682970--

------=_Part_536_361725805.1649758682970--
