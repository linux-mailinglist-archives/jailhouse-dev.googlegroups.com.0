Return-Path: <jailhouse-dev+bncBCE6JKFIVQARB2NETH3QKGQEWX3CNJA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x23e.google.com (mail-oi1-x23e.google.com [IPv6:2607:f8b0:4864:20::23e])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FAC61F89A7
	for <lists+jailhouse-dev@lfdr.de>; Sun, 14 Jun 2020 18:38:03 +0200 (CEST)
Received: by mail-oi1-x23e.google.com with SMTP id q65sf3792906oig.15
        for <lists+jailhouse-dev@lfdr.de>; Sun, 14 Jun 2020 09:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=La58NS73w0ROTrewzjzQ4qbYJ/l7iaTkX7VOnCuf7Q0=;
        b=ixxQwVj3by8XnYnzhP+oOM2yELJpTNPrkiLsOLnhQVAnNedSDSfSzOfuASWLvy3AAW
         0StlfWONNOqAZEh0PP/aAXA3eeXcHAxrc4vBjOaWl6xk+LDMZxhtPFjULgYlZl2x0y2z
         VjIFVT4goOHKVe18VRVfYadGrcmntmHlF3guapI0wDym1TkV88IExvxtnR/344uvELcl
         wh6oqRCALpyS3GB69DaztggP+n1XnjXRcHYYvwxhfNSh8sgStMEoc3GlM49VwYSWPM1D
         uQFXF9h5mk7CRuwjts8XD6x4h3KIdhEtqFkC0K6+Vfqs9DM3KocU8CTDcCYTmvWrtccf
         pGKw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=La58NS73w0ROTrewzjzQ4qbYJ/l7iaTkX7VOnCuf7Q0=;
        b=WkrGccVWpqA0ic6ztkI/Wvhd82qqC+2zYgS39Pt+eP3Ae3zL/uS202RbdL3EqmchTO
         jkC806EZAaUXW0wcJJOgu4Gh1Avy3uERvmy7jr+7Fnm/Jt7abRR1I368eSQwXi+tZp6m
         SeFjOlFpysRbJ+pK+xIS+BfncNKQDDFVZ7TWGslQAyRiDu78YY9I8E3jA/J6mwHsN1lM
         6HBmal5t8cBgD84s9GFlvXHMRPp+ouNCr3jB7e7+25uIYnLOQsw1B83QxqFTjOH2O7+c
         MLvd1/BtP4PY2dJtcC3tksHR2BILP/TpEuCNJoTSrp+avvLK04oxZXHRSZUfuGbuNyzz
         46vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=La58NS73w0ROTrewzjzQ4qbYJ/l7iaTkX7VOnCuf7Q0=;
        b=pV6U2x6jHzMtC+Zlnlu/rxokXZ3fRj1LLR2C56fDmbdZvYLNMmCMiYkAgeN5MIXvX/
         Ojx+d2VRTpwQTEdg8tzV47zQGTdZRIzerJgp83Ct0pESHxiis/ktyJ2lENhsjLo1u22s
         Vh6g8BlvwsvZrXLzVNdVq+EBOTQhNDid/ZdiZRxM8/+2LHKr7qV4vwUw5yXoVdQt2ZZu
         nnyuwc49QrdO9/JVnYzaV0u3tbtgOVkDIgI9iJtJlLzI8t9oD08yGSn4L3Kx8bsSduRo
         ZQcw4Zs2ve/6wO1WbDzdKr31GZeYgWWsgsSaDi50oBrCucKM0Lku8N0oOKjAY/yPdCbD
         gQgg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5315mddr4iIu0yrE7bsSFPPrOWvHQA4oGU3RVv57opp9raSo8oow
	q18e3L0WOrMhtEtixLKGOZg=
X-Google-Smtp-Source: ABdhPJyhVgrBmx07t6X8gJpYn5CugVDQ6EaC7Qks3F79un/nlZi7c504nKxIVlWi9n77q/2B8Cvpkw==
X-Received: by 2002:a9d:6ad5:: with SMTP id m21mr18431136otq.307.1592152681695;
        Sun, 14 Jun 2020 09:38:01 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:cd89:: with SMTP id d131ls298432oig.11.gmail; Sun, 14
 Jun 2020 09:38:01 -0700 (PDT)
X-Received: by 2002:aca:f5d7:: with SMTP id t206mr6033317oih.143.1592152681166;
        Sun, 14 Jun 2020 09:38:01 -0700 (PDT)
Date: Sun, 14 Jun 2020 09:38:00 -0700 (PDT)
From: Pratik Patil <prtptl.smilingcorpse@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <5961483c-f62a-422d-b1ae-1cd7adda81efo@googlegroups.com>
In-Reply-To: <CAJxPjDwf667o3SHfPLmq8e9z72nMSLsZV6SWk+byEtk61ghXmA@mail.gmail.com>
References: <9b648b5a-97c7-473f-8631-d55064a5b69fo@googlegroups.com> <e4a04bc1-1254-5d12-05b7-cbd717815078@siemens.com>
 <CAJxPjDwf667o3SHfPLmq8e9z72nMSLsZV6SWk+byEtk61ghXmA@mail.gmail.com>
Subject: Re: Reboot root cell
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_945_92675098.1592152680320"
X-Original-Sender: prtptl.smilingcorpse@gmail.com
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

------=_Part_945_92675098.1592152680320
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I am assessing production readiness of Jailhouse in terms of updating the h=
ypervisor or the root cell without stopping VMs(non-root cells). Periodic b=
ug fixes or security patches can require rebooting the root cell OS. This i=
s generally done through live migration of guests and cluster-aware updatin=
g in hypervisors like hyper-v, ESXi etc. I am curious how updates and reboo=
ts can be done in Jailhouse without stopping operation in non-root cells.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/5961483c-f62a-422d-b1ae-1cd7adda81efo%40googlegroups.com.

------=_Part_945_92675098.1592152680320--
