Return-Path: <jailhouse-dev+bncBC65DHEH7QOBBR7TXL6AKGQE4XIYUSA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x83f.google.com (mail-qt1-x83f.google.com [IPv6:2607:f8b0:4864:20::83f])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7DC29390E
	for <lists+jailhouse-dev@lfdr.de>; Tue, 20 Oct 2020 12:19:53 +0200 (CEST)
Received: by mail-qt1-x83f.google.com with SMTP id o25sf1144878qtt.3
        for <lists+jailhouse-dev@lfdr.de>; Tue, 20 Oct 2020 03:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=eWBRXy4lSwdwsSih8tVATwuiQOhE8BQikGfG+51X6Is=;
        b=e4S67I28AGrqM0kdvdCCgMjMcpaASdVmCsNKBUSDeF77ePtqdv8IkioFLskNiYbPjB
         qpSnT7AKAqXPJiY7Czxfwt+k6GKkAkssxKTv+ARvTi6vrmA9Qdyz3YE5jECKmOcykrnC
         dtXecqKGXr3vTZp/QuOGacHJprRbEgM/1y2hLr9qcXsHeS97fE3JwB5gnlZdGzIqe2a2
         Nnnsb0Zow3EaV5tsrI5XAQaZKfIsi6VNFFvdh7LjkxUsFB5QE36PZowvNs76/sKDOXB5
         JhW62+8J6oZlLxlceSI9slhe+Xu5P8FSPrxt8ldr+wqSDsnkPKWH4vfroLEjYbVm2mfU
         +LVQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=unikie-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=eWBRXy4lSwdwsSih8tVATwuiQOhE8BQikGfG+51X6Is=;
        b=XRX+/xnVbPGVRwtbgtmjP9yTqXZRil2HOSmXQUvQ1hSLIzLjMQgFaCX55bDuy8wd4Y
         oWRVXxHWhoScgGnZKpfFxzE8xlEZxOYfZ03Mw1k8++QMLh1spTaMHX6b2e5tXIb2ArHr
         Sl79vE10vYbojaqxGwFppAUPLZi+YMlgZUdkIqGIfYw21mIYuN9Z8j9NcgWKjnNEXvwr
         SG7/mNHLQfUyoWQ+AitPQzAjVUnG2b+ZpRpRtOscvUvy7rqgNw8d58hI+xuRWnzf44j2
         ZH76o1q+7/mX79GLo/Rk4lKKJurkY4/TbHUubWDt95f8uM72fiMyi5OlFa9fyKtxegXe
         YRcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=eWBRXy4lSwdwsSih8tVATwuiQOhE8BQikGfG+51X6Is=;
        b=f40u3qurXBUz/rZKlxZdJSmVfIRwyyIDH3gTUipfZBPZgWUV/G2EtXRk8N7yjvW3z4
         Xqahgu/dJK9iTwYj6v2Ind+aE2Mv9v8U4kYvqp7D5sfHAIQsBd/SRxJSFMXdk8DVJKyj
         4xTSHbxPLOPgLXcQ9fMM1mtCKyxiR6nb3WWvtD1Qer6qQtWykg8BzoGap47xGpEa/o9T
         /lVVCOF64QEAN/MV3VFd/Jpo5ol0+j1ESVfVCqmHzJM5zOypmBNBx+sLh//M8nucb3Yw
         dyL2IePNBMkW+TXSDu+eJU0RlypUJBKzrEGkCNaLsgaun2jkHfC5TxmIpVZoAyRyejG1
         aEfQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530hMvv5syupVubSfB4DdaInACBNL4v039DsW7ZjkEm7CVM5Oks5
	RjjwU+d6bfmiBN3HTct4ReY=
X-Google-Smtp-Source: ABdhPJyVulwPY6YUrhb9hMFehezcB4oPWVMSzUok3MdzG2AP8sJlSXAylqeEcYfEmZqkpMa1mJLdUQ==
X-Received: by 2002:a05:620a:2148:: with SMTP id m8mr17427qkm.19.1603189192001;
        Tue, 20 Oct 2020 03:19:52 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:622a:10f:: with SMTP id u15ls511247qtw.10.gmail; Tue, 20
 Oct 2020 03:19:51 -0700 (PDT)
X-Received: by 2002:ac8:488e:: with SMTP id i14mr1687970qtq.386.1603189191082;
        Tue, 20 Oct 2020 03:19:51 -0700 (PDT)
Date: Tue, 20 Oct 2020 03:19:50 -0700 (PDT)
From: Jari Ronkainen <jari.ronkainen@unikie.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <b4510771-f6f0-4771-9fe8-50a39589bd88n@googlegroups.com>
In-Reply-To: <cd0ba433-1be8-4c99-841e-d637d2e5fb54n@googlegroups.com>
References: <cd0ba433-1be8-4c99-841e-d637d2e5fb54n@googlegroups.com>
Subject: Re: Jailhouse in qemu and ubuntu
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_112_905715606.1603189190594"
X-Original-Sender: jari.ronkainen@unikie.com
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

------=_Part_112_905715606.1603189190594
Content-Type: multipart/alternative; 
	boundary="----=_Part_113_1485642018.1603189190594"

------=_Part_113_1485642018.1603189190594
Content-Type: text/plain; charset="UTF-8"

I noticed that dmesg gives me

jailhouse: not as system configuration

, but this is the example .cell file that builds
with the source code and is used as an example
in the README.md?
On Tuesday, October 20, 2020 at 12:56:36 PM UTC+3 Jari Ronkainen wrote:

> Hi,
>
> I'm interested in running ROS2 in a Linux cell, first through
> QEMU and later on Up Xtreme board.  Apologies for stupid
> questions,  and please refer me to a more appropriate forum
> if this is the wrong place for them.
>
> First I have built a fresh virtual machine and installed Ubuntu
> 20.04 LTS, then installed linux headers, build tools and python
> through apt.
>
> The compilation and installing seems to work fine, but when I
> get to the point where I should do
>
> # jailhouse enable jailhouse/configs/qemu-x86.cell
>
> I get an error message
>
> JAILHOUSE_ENABLE: Invalid argument
>
> I do not know how to get past this, any help?
>
>
> Other things is it seems like the documentation is not entirely
> up to date, and I noticed things like experimental virtio support
> and IPC reworkings in 0.12 release notes, is there any more info
> about those in the wild or should I just dig through git commits?
>
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/b4510771-f6f0-4771-9fe8-50a39589bd88n%40googlegroups.com.

------=_Part_113_1485642018.1603189190594
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I noticed that dmesg gives me<div><br></div><div>jailhouse: not as system c=
onfiguration</div><div><br></div><div>, but this is the example .cell file =
that builds</div><div>with the source code and is used as an example</div><=
div>in the README.md?</div><div class=3D"gmail_quote"><div dir=3D"auto" cla=
ss=3D"gmail_attr">On Tuesday, October 20, 2020 at 12:56:36 PM UTC+3 Jari Ro=
nkainen wrote:<br/></div><blockquote class=3D"gmail_quote" style=3D"margin:=
 0 0 0 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;=
">Hi,<div><br></div><div>I&#39;m interested in running ROS2 in a Linux cell=
, first through</div><div>QEMU and later on Up Xtreme board.=C2=A0 Apologie=
s for stupid</div><div>questions,=C2=A0 and please refer me to a more appro=
priate forum</div><div>if this is the wrong place for them.</div><div><br><=
/div><div>First I have built a fresh virtual machine and installed Ubuntu</=
div><div>20.04 LTS, then installed linux headers, build tools and python</d=
iv><div>through apt.</div><div><br></div><div>The compilation and installin=
g seems to work fine, but when I</div><div>get to the point where I should =
do</div><div><br></div><div># jailhouse enable jailhouse/configs/qemu-x86.c=
ell</div><div><br></div><div>I get an error message</div><div><br></div><di=
v>JAILHOUSE_ENABLE: Invalid argument</div><div><br></div><div>I do not know=
 how to get past this, any help?</div><div><br></div><div><br></div><div>Ot=
her things is it seems like the documentation is not entirely</div><div>up =
to date, and I noticed things like experimental virtio support</div><div>an=
d IPC reworkings in 0.12 release notes, is there any more info</div><div>ab=
out those in the wild or should I just dig through git commits?</div><div><=
br></div></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/b4510771-f6f0-4771-9fe8-50a39589bd88n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/b4510771-f6f0-4771-9fe8-50a39589bd88n%40googlegroups.co=
m</a>.<br />

------=_Part_113_1485642018.1603189190594--

------=_Part_112_905715606.1603189190594--
