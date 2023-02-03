Return-Path: <jailhouse-dev+bncBC4ILIEFEIINDYPVTYDBUBDGGHKC6@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pl1-x639.google.com (mail-pl1-x639.google.com [IPv6:2607:f8b0:4864:20::639])
	by mail.lfdr.de (Postfix) with ESMTPS id D57DF68A3A6
	for <lists+jailhouse-dev@lfdr.de>; Fri,  3 Feb 2023 21:38:43 +0100 (CET)
Received: by mail-pl1-x639.google.com with SMTP id jb3-20020a170903258300b0019656c8cf8dsf3059963plb.17
        for <lists+jailhouse-dev@lfdr.de>; Fri, 03 Feb 2023 12:38:43 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1675456722; cv=pass;
        d=google.com; s=arc-20160816;
        b=FKOYVRV747x8PWjgzjq8oe/L+f2LTqBCLNK+ASg4PUSk1mOdMaT6GdbcZ2iK/35bxZ
         A/+4RcDi8reYbhPCpB+iyC2jlnDOSY858UbAB4/4WgI78UwOLcAUsB2MKWkYiq0JNg43
         N8iUdG4win7mvljGDywkPP45/xl3W2+Xz+jqqyjw1Rz2OEmHV0DxkP7iSUpDenUOqRUj
         jJhHhVK5OGtm07nna7qcYaNviArKQv3Z1R79OcXxtKux4YpvExBvxMGuRxTNSSOviAj7
         lFRg1a3yhNmCuvHyxEIFtE+xPhlf0AWUn4ttRyiVs16MhN4v+8XHH+ZFIjrjt9Pkm5n1
         qn5w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=XARQrS5Y5R7VJlpAKPRMLo7YnJBga9Pe8vsfHpiPgg4=;
        b=yiA/qF1QEo4T1Tti3BebzdXZF1SdH3urQUyCEFJ2eST6N/0AdBPe7eNeVYYi9cjGgc
         +1TUwOf5SxsqfpcIzCbyu80PcNU+Foj88fTICVkn7fY1zH9OFwjw88aB9uimjOWpiL94
         wf75055fFpj4i/h4yVwK94+WsWCk2LrpIEsHjPDNhlOO2vwPOCe+/IjTNcrmkC+p0EsP
         5CGvH8VZe64OyGEKauhSu+2Df3+ussjt/QK6eJzz6Fn9OjrWa2qzp+Ac+9skT0eEYv7x
         b6/eehfYovZPGEB5mJlh7NZ6BRaj5+CPlGse+CiL+ji+NCwid6UrBUIdSNI8f8TqX1YU
         yJdQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@foundries.io header.s=google header.b=FcsUogDk;
       spf=pass (google.com: domain of ricardo@foundries.io designates 2001:4860:4864:20::31 as permitted sender) smtp.mailfrom=ricardo@foundries.io
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:message-id:date:subject:cc:to:from
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=XARQrS5Y5R7VJlpAKPRMLo7YnJBga9Pe8vsfHpiPgg4=;
        b=l8o61HOto8DVkyKxGk7gjCwPI36/tCtxgtpMvGXrOvgwZudEiu5aQ2RvI+DB6dFpL1
         t83/zcaJ099Bbd67Iyb40YA1z9HXOF9Xhkx7hkEZXISH1vfnVl0iHyUGtjdfA5HAjKP+
         dRScCZvODOKn3wCp2IQex54RdbwsYwSUcYKRGswQf+0MkORZQntE0afJ1MLD/kXXiJTn
         36nu6wViWM3RLhV8sNYe6PhG0Tutw24p2qHo0RXCF4/i9R17maeG7F4FjnrggIQetjEG
         qMJh6uTJmlryoAMhakxuvbHiNBq1hyhURuN3KjTjROBhdKq9f0Wk5Nei++J7SpL3qI4e
         GtxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :message-id:date:subject:cc:to:from:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XARQrS5Y5R7VJlpAKPRMLo7YnJBga9Pe8vsfHpiPgg4=;
        b=3jmPRXIzcNQUIihV471XBVuATgNWw+BOVOLjhbdVJi3VJD0rAHAwsu+Otb+f63wN1u
         px4RjQM85lZQBiw5g+WYB70jW9r7w0GLcBpeWkZmEWCyQlnHuLyUR5GHmcJ7Ydpf4210
         wX6XnpkfTA965is9jb5KTugbK7WnL2ANwxbPnfoaw0JZ3SfFhFx/GEgJT7Hi06CiRHca
         6GzO1VfXZJIgBOzuaku3BqN7nSLB8SNpZgwgolTSYVz83Q17x9Z21l65QG2AhBSX7NNz
         4FeM0EZVrFdNPX35KkCVGM0Jns9AeSvZPkTzFvInd0xNwzTyV9rk4QJ0JQC87hw2tHB8
         +VQQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AO0yUKUaOwy5SabJLAGnBFFHnfUoiscrhNXSBdmEcCSsf0WLgw9Hu5im
	SqLNbxpsNvw06qjI6/6Eo9U=
X-Google-Smtp-Source: AK7set94tnSWcPgcoczMtV+VAf12kE35Ez/TdbDEaVtqYkFgtuYPEcgbSUvTus8O/yvtlY0l+Uzp2g==
X-Received: by 2002:a17:90a:15:b0:230:6ba2:614b with SMTP id 21-20020a17090a001500b002306ba2614bmr920759pja.100.1675456722000;
        Fri, 03 Feb 2023 12:38:42 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:90b:3910:b0:22b:eeb8:fd6a with SMTP id
 ob16-20020a17090b391000b0022beeb8fd6als6560864pjb.1.-pod-control-gmail; Fri,
 03 Feb 2023 12:38:41 -0800 (PST)
X-Received: by 2002:a17:902:d293:b0:196:6215:8856 with SMTP id t19-20020a170902d29300b0019662158856mr8856456plc.64.1675456720912;
        Fri, 03 Feb 2023 12:38:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675456720; cv=none;
        d=google.com; s=arc-20160816;
        b=H2PUnv7YcGdgowJW5jSx7lNC9qwlC1xTCtPkJ3n7qCnzNpYX2uzn0GprkT8TSdW5hc
         PPrQTICLcfXCprS2+DXx6+VbJ7KDuriLtap0txEKJLRW0RImyiEMoAyxAAPyfLn/8fCD
         ehbEpvdZ0/vqPh5GbVIlMvyPV5qlVcNM4JO8vcPqv8KjR3gJ7y8kMlSMZWZ7YYkeAwT/
         BO0e4u+FOFLKH1Lwdk9GkUu++CSX7XcPPytDQbgwuEm6jXuRoMMuwPhek9dED66bhQTd
         UCV+TQM+H83/lo0DPr5xy21/n1evnQOP5VDk1FC1aXnfH0jT1xypUwGhrom+R+XQG3vt
         nG2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=l8LKoqbFZ7OtFVNNPrtbQ61HVN+TD/O0ePav8Fc3uwU=;
        b=DKs2EdFT04+Ei0ivlsrScxjB6BmKbe8QEtCPyWoHlfASuZybnb4T3kR2bQAehtUdSp
         WZ7/iPKexevLj21uLU8ADDZj6Ybw60ipw2LtMCkzSNLOto4gRq8q+GSZrt7VHX0XWdsx
         sA7hHiKN18aXV4T8FiFY9MHv/dc/iWkz9DLSO4ucyZT7HizA86pzZOpc7tblMxLARipQ
         iqyG2YDuz4W7bb2OpUru8iuqQAAG620Mc6nowptyUX3z6sYj+W/0pcrltfM3uElo5i0/
         ieLt0whKx4sH4LfIEwQte/s4bI81jn4dfpz5RuR4n9s1yxPQdoF+8HAvoKMgs7YIIeLd
         uELQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@foundries.io header.s=google header.b=FcsUogDk;
       spf=pass (google.com: domain of ricardo@foundries.io designates 2001:4860:4864:20::31 as permitted sender) smtp.mailfrom=ricardo@foundries.io
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com. [2001:4860:4864:20::31])
        by gmr-mx.google.com with ESMTPS id iy6-20020a170903130600b00189ad838080si264071plb.8.2023.02.03.12.38.40
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Feb 2023 12:38:40 -0800 (PST)
Received-SPF: pass (google.com: domain of ricardo@foundries.io designates 2001:4860:4864:20::31 as permitted sender) client-ip=2001:4860:4864:20::31;
Received: by mail-oa1-x31.google.com with SMTP id 586e51a60fabf-169ba826189so8086650fac.2
        for <jailhouse-dev@googlegroups.com>; Fri, 03 Feb 2023 12:38:40 -0800 (PST)
X-Received: by 2002:a05:6870:9107:b0:163:92dd:a164 with SMTP id o7-20020a056870910700b0016392dda164mr6890403oae.44.1675456719552;
        Fri, 03 Feb 2023 12:38:39 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:badc:845d:dfac:d1f8:a7d2:47ed])
        by smtp.gmail.com with ESMTPSA id k7-20020a056870350700b001631914e41asm1197748oah.33.2023.02.03.12.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Feb 2023 12:38:38 -0800 (PST)
From: Ricardo Salveti <ricardo@foundries.io>
To: jailhouse-dev@googlegroups.com
Cc: jan.kiszka@siemens.com,
	dannenberg@ti.com,
	mranostay@ti.com
Subject: [PATCH 0/4] Config updates for k3-am625-sk
Date: Fri,  3 Feb 2023 17:38:27 -0300
Message-Id: <20230203203831.46311-1-ricardo@foundries.io>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Original-Sender: ricardo@foundries.io
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@foundries.io header.s=google header.b=FcsUogDk;       spf=pass
 (google.com: domain of ricardo@foundries.io designates 2001:4860:4864:20::31
 as permitted sender) smtp.mailfrom=ricardo@foundries.io
Content-Type: text/plain; charset="UTF-8"
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

Config updates for making it compatible with the latest TI BPS kernel.

Tested with ti-linux-kernel cicd.dunfell.202301120721 (5.10 based) on
am62xx-sk.

Andreas Dannenberg (3):
  configs: arm64: k3-am625-sk: Add crypto memory region
  configs: arm64: k3-am625-sk: Switch inmate boot console alias to
    serial3
  configs: arm64: k3-am625-sk: Add GPMC memory region

Ricardo Salveti (1):
  configs: arm64: k3-am625-sk: add vtm memory node

 configs/arm64/dts/inmate-k3-am625-sk.dts | 11 +++++----
 configs/arm64/k3-am625-sk.c              | 30 +++++++++++++++++++++++-
 2 files changed, 35 insertions(+), 6 deletions(-)

-- 
2.34.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230203203831.46311-1-ricardo%40foundries.io.
