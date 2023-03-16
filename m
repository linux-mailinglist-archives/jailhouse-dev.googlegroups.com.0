Return-Path: <jailhouse-dev+bncBCBJJVUE3MMRBQ75ZSQAMGQE3E6I4SQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3d.google.com (mail-yb1-xb3d.google.com [IPv6:2607:f8b0:4864:20::b3d])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A78D6BD4AB
	for <lists+jailhouse-dev@lfdr.de>; Thu, 16 Mar 2023 17:07:33 +0100 (CET)
Received: by mail-yb1-xb3d.google.com with SMTP id z4-20020a25bb04000000b00b392ae70300sf2311826ybg.21
        for <lists+jailhouse-dev@lfdr.de>; Thu, 16 Mar 2023 09:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112; t=1678982852;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zkXfHtPKtvileqwwAvReFzyoZ0Kjz4yZh1WcGaf6Xb0=;
        b=VT+rsz6pSd69nWWXZIwfUzwrtdTcypCCJmArFp2+5RsPm6l1J9URjJNL5NvWvWomPe
         yV8cVF1/zN7UVUkafHhY5SmFBoSTRv/Tx9nrpp3IBPnyi7D8oVyrVb0R9k3YxcWHu2U5
         rfQ8C172GKZnyANtX2MZjUqWaDHS/KxUbSiEHEUZVSgP0ouQQR7WluE4C5yeBngN75Au
         XK1T0bDk2b0sKeyWdl16gBwXyqpNpUOemdyPtIef4ovwaKKFlAWX6XReTyE1U+4aV058
         YiOFiG6N/9XgZCYDww9PZ1suxmMlin7nAu5pChCcfo6WVu6sBBXUGbirkiA99FkNT02k
         wmyw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678982852;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zkXfHtPKtvileqwwAvReFzyoZ0Kjz4yZh1WcGaf6Xb0=;
        b=aGJ9AnWIa/CKdmV4B3Bet+0hyTz9uFqGuh8/yEfoTJs0fx+Ge/91nQZulvoDqC8hzj
         nnycnoVnbw/+zNLluX+80rhL/Vrer7XBsU4Qf2IWQ/7fTyT0iQgQnYHHGwdF7AI9TM6N
         MNtq5C4mLxRzZM5GYtbROCvBewV4S9oKvjL0UmMVGSy5zLNkzjHJEbShIRDrT4sX6w50
         XU73/IUb9LhxRUvnvjG33DYJLmYKxHkcMW8PUFl3Ca+/F6l7g6K+Ci1DYzB371qIf9Y9
         ETxX4pRO2eJ3uNg/lPELHJRlcRl4XYc8r4n2UWvn5jEkxME47j25Kr1/jHNXLrXKNaqM
         zbvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678982852;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:message-id:to:from:date
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zkXfHtPKtvileqwwAvReFzyoZ0Kjz4yZh1WcGaf6Xb0=;
        b=XmHx31c022Un/RDPq95MWO5QLE5YqLAhgTJ8/y94VWk/PN9pcHOOKoUEL9lqplv+bU
         YFHTf4Pjfr5L7b1EgGI5jbuvJTtdPlZh7SgLYb1C96S55l1So3al+jzFsmKx5PEW/l9R
         el8Sjr7lAuDrlywpRig4cP1S0LNU6B9P1qlSHJ3c/f1GqxJ4CKxqbk45do2dWC3iirlq
         JOUaHd0WG1bCKQh/5g0kt3r3VOFyXLSbStscpPDbhYKMCEuMzpQJ4GN+FTsj6x67kKcz
         4WFXIOQFzyIzdEiQAYX/qVMZGBtC09fcpztbZDDtmqUL5s8XMJXs4PH9mcMah4XYiMxW
         JNAQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AO0yUKXReK6u719HEYHe8bsPWoktE6vrbVnYdomW33Nv87rdyKRen+Ya
	TldhCCOK3soXqRbXD/X/Pxs=
X-Google-Smtp-Source: AK7set8XYygbJv5pcgSF+XaQdVAGWjB6sg3vA1RHRfXdYeU+BlHbrVpJId+3v/uGr14BzZu8qiAvPg==
X-Received: by 2002:a05:6902:188:b0:a99:de9d:d504 with SMTP id t8-20020a056902018800b00a99de9dd504mr28271392ybh.12.1678982851820;
        Thu, 16 Mar 2023 09:07:31 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:ae1f:0:b0:b2f:abaa:a54a with SMTP id a31-20020a25ae1f000000b00b2fabaaa54als104487ybj.6.-pod-prod-gmail;
 Thu, 16 Mar 2023 09:07:30 -0700 (PDT)
X-Received: by 2002:a05:6902:725:b0:b58:b42d:945c with SMTP id l5-20020a056902072500b00b58b42d945cmr1887873ybt.0.1678982850757;
        Thu, 16 Mar 2023 09:07:30 -0700 (PDT)
Date: Thu, 16 Mar 2023 09:07:30 -0700 (PDT)
From: Yelena Konyukh <ykonyukh@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <f38fba53-5ab2-45bc-94f7-0a191d6aa0d8n@googlegroups.com>
Subject: issue with VNIC for 2nd NR-Linux cell
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_1782_203152415.1678982850149"
X-Original-Sender: ykonyukh@gmail.com
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

------=_Part_1782_203152415.1678982850149
Content-Type: multipart/alternative; 
	boundary="----=_Part_1783_253516230.1678982850149"

------=_Part_1783_253516230.1678982850149
Content-Type: text/plain; charset="UTF-8"


Hi All,

I would be very grateful for any comments on the issue described below:

I have Jailhouse setup on ARM64 platform with Zynq SoC, where I have 2 
Non-Root Linux cells. I need to provide network access for both NR-Linux 
cells. 
To achieve that, I have configured the root cell to have 2 VNICs - one for 
NR-Linux cell 1 (on .bdf 0<<3)  and one for NR-Linux cell 2 (on .bdf << 1). 

While network comms between the root and the cell 1 work fine (cells ping 
each other, cell 1  can use the root as a router and get external network 
access), network comms between the root and cell 2 do not work.

Initially, I expected it to be an issue with the VNIC's interrupt in cell 
2. That does not seem to be the case. When cell 2 starts ( Linux is 
booted), the count on the corresponding IRQ line is 6. What I've found so 
far, is that when I ping the cell 2 from the root, no ivshm_net_xmit() is 
invoked on the root as a result of the ping. 

I expected ivshm_net_xmit() to be invoked, because it looks to me this is 
how an interrupt is raised to a NR-Linux cell:
ivshm_net_xmit()->ivshm_net_notify_tx()->write to the relevant doorbell 
register->an interrupt is raised on the peer.

Funnily enough, if I move my NR-Linux cell 2 to use .bdf 0, rather than 
1<<3, or leave it to use 1<<3, but have only one VNIC in the root, then my 
cell 2 gets network access...

Has anyone seen anything similar?
Or could give any pointers of what might be going wrong?
Has anyone managed to have network access for > 1 NR-Linux cell on ARM64?

I could share my code and logs, if that could help anyone help me :).

Thank you very much in advance.

Best Regards,

Yelena

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/f38fba53-5ab2-45bc-94f7-0a191d6aa0d8n%40googlegroups.com.

------=_Part_1783_253516230.1678982850149
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br />Hi All,<br /><br />I would be very grateful for any comments on the i=
ssue described below:<br /><br />I have Jailhouse setup on ARM64 platform w=
ith Zynq SoC, where I have 2 Non-Root Linux cells. I need to provide networ=
k access for both NR-Linux cells. <br />To achieve that, I have configured =
the root cell to have 2 VNICs - one for NR-Linux cell 1 (on .bdf 0&lt;&lt;3=
)=C2=A0 and one for NR-Linux cell 2 (on .bdf &lt;&lt; 1). <br /><br />While=
 network comms between the root and the cell 1 work fine (cells ping each o=
ther, cell 1=C2=A0 can use the root as a router and get external network ac=
cess), network comms between the root and cell 2 do not work.<br /><br />In=
itially, I expected it to be an issue with the VNIC's interrupt in cell 2. =
That does not seem to be the case. When cell 2 starts ( Linux is booted), t=
he count on the corresponding IRQ line is 6. What I've found so far, is tha=
t when I ping the cell 2 from the root, no ivshm_net_xmit() is invoked on t=
he root as a result of the ping. <br /><br />I expected ivshm_net_xmit() to=
 be invoked, because it looks to me this is how an interrupt is raised to a=
 NR-Linux cell:<br />ivshm_net_xmit()-&gt;ivshm_net_notify_tx()-&gt;write t=
o the relevant doorbell register-&gt;an interrupt is raised on the peer.<br=
 /><br />Funnily enough, if I move my NR-Linux cell 2 to use .bdf 0, rather=
 than 1&lt;&lt;3, or leave it to use 1&lt;&lt;3, but have only one VNIC in =
the root, then my cell 2 gets network access...<br /><br />Has anyone seen =
anything similar?<br />Or could give any pointers of what might be going wr=
ong?<br />Has anyone managed to have network access for &gt; 1 NR-Linux cel=
l on ARM64?<br /><br />I could share my code and logs, if that could help a=
nyone help me :).<br /><br />Thank you very much in advance.<br /><br />Bes=
t Regards,<br /><br />Yelena<br /><br />

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/f38fba53-5ab2-45bc-94f7-0a191d6aa0d8n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/f38fba53-5ab2-45bc-94f7-0a191d6aa0d8n%40googlegroups.co=
m</a>.<br />

------=_Part_1783_253516230.1678982850149--

------=_Part_1782_203152415.1678982850149--
